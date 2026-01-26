// Created by Chester for MSCWorld in 2025

import ARKit
import Foundation
import RealityKit
import RealityKitContent

@MainActor
@Observable
class HandTrackModel {
    private let root = Entity()
    
    private let session = ARKitSession()
    private let handTracking = HandTrackingProvider()
    
    init() {
        if let tree = try? Entity.load(named: "tree", in: realityKitContentBundle) {
            tree.name = "tree"
            tree.scale *= 0.03
            root.addChild(tree)
        }
    }

    func setupEntity() -> Entity {
        return root
    }
    
    func runSession() async {
        do {
            if HandTrackingProvider.isSupported {
                print("Hand track supported, ready to start session.")
                try await session.run([handTracking])
            } else {
                print("Hand track not supported")
            }
        } catch {
            print("Run ARKitSession error:", error)
        }
    }
    
    func processHandUpdates() async {
        for await update in handTracking.anchorUpdates {
            let handAnchor = update.anchor
            guard handAnchor.isTracked else { continue }
            
            if handAnchor.chirality == .right {
                continue
            }
            
            guard
                let indexFingertip = handAnchor.handSkeleton?.joint(.indexFingerTip),
                let thumbFingertip = handAnchor.handSkeleton?.joint(.thumbTip),
                let littleFingertip = handAnchor.handSkeleton?.joint(.littleFingerTip),
                let wrist = handAnchor.handSkeleton?.joint(.wrist),
                indexFingertip.isTracked,
                thumbFingertip.isTracked,
                littleFingertip.isTracked
            else { continue }
            
            let indexPosition = getPosition(calculateJointTransform(handAnchor: handAnchor, joint: indexFingertip))
            let thumbPosition = getPosition(calculateJointTransform(handAnchor: handAnchor, joint: thumbFingertip))
            let littlePosition = getPosition(calculateJointTransform(handAnchor: handAnchor, joint: littleFingertip))
            let wristPosition = getPosition(calculateJointTransform(handAnchor: handAnchor, joint: wrist))

            // 判断手掌是否张开，使用拇指和小指的距离
            let thumbLittleDistance = distance(thumbPosition, littlePosition)
            let indexLittleDistance = distance(indexPosition, littlePosition)
            
            // 判断手掌是否向上（根据手指方向或者手掌朝向计算）
            let palmDirection = normalize(wristPosition - (thumbPosition + littlePosition) / 2)
            let handUpward = palmDirection.y < 0

            // 判断拇指和小指距离
            if thumbLittleDistance > 0.06, indexLittleDistance > 0.06, handUpward {
                let centerPosition: SIMD3<Float> = (indexPosition + thumbPosition + littlePosition) / 3
                let position: SIMD3<Float> = centerPosition + [0.02, 0.08, 0.02]
                
                // 计算手掌的朝向
                let forwardDirection = normalize(indexPosition - wristPosition)
                let initialRightDirection = normalize(littlePosition - thumbPosition)
                let upDirection = normalize(cross(forwardDirection, initialRightDirection))
                let rightDirection = cross(upDirection, forwardDirection)

                // 构建旋转矩阵并转换为四元数
                let rotationMatrix = float3x3(columns: (rightDirection, upDirection, forwardDirection))
                let handOrientation = simd_quatf(rotationMatrix)
                
                // 设置树的位置和旋转
                if let tree = root.findEntity(named: "tree") {
                    tree.position = position
                    tree.orientation = handOrientation * simd_quatf(angle: .pi * 0.9, axis: [1, 0, 0])
                }
            }
        }
    }
    
    private func getPosition(_ transform: float4x4) -> SIMD3<Float> {
        return transform.columns.3[SIMD3(0, 1, 2)]
    }
    
    private func calculateJointTransform(handAnchor: HandAnchor, joint: HandSkeleton.Joint) -> float4x4 {
        let originFromWrist = handAnchor.originFromAnchorTransform
        let wristFromIndex = joint.anchorFromJointTransform
        return matrix_multiply(originFromWrist, wristFromIndex)
    }
}
