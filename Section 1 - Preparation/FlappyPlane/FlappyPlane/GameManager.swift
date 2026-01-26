// Created by Chester for FlappyPlane in 2025

import Foundation
import RealityKit
import RealityKitContent
import Spatial
import SwiftUI

@MainActor
@Observable
class GameManager {
    var score: Int = 0

    let rootEntity = Entity()
    var plane: Entity?

    private var cloudTemplate: Entity?
    private var cloudTimer: DispatchSourceTimer?
    private var isSchedulingClouds = false

    private var tasks: [DispatchWorkItem] = []
    private var colisionSubs: EventSubscription?

    // Feedback
    private var hitAudio: AudioFileResource?
    private var particleEmitter: Entity?

    init() {
        setupRoot()
        setupCloud()
        setupAudio()
    }

    func setupRoot() {
        rootEntity.name = "Root"
    }

    func setupCloud() {
        cloudTemplate = try? Entity.load(named: "CloudPrefab", in: realityKitContentBundle)

        let particleEmitter = cloudTemplate?.findEntity(named: "ParticleEmitter")
        print("Emitter=\(particleEmitter?.name ?? "NIL")")
        
        if cloudTemplate == nil {
            print("Failed to load cloud")
        }
    }

    func setupAudio() {
        Task {
            hitAudio = try? await AudioFileResource(
                named: "hit.mp3",
                configuration: .init(shouldLoop: false)
            )
        }
    }

    func stop() {
        for task in tasks {
            task.cancel()
        }
        tasks.removeAll()
        for entity in rootEntity.children {
            entity.removeFromParent()
        }
        score = 0
    }

    func spawnPlane() async throws -> Entity {
        let plane = try await createPlane()
        plane.position = [0, 1.5, -2]
        plane.transform.rotation *= simd_quatf(angle: .pi / 2, axis: [0, 1, 0])
        return plane
    }

    private func createPlane() async throws -> Entity {
        let plane = try await Entity.makePlane()
        plane.scale *= 0.1

        rootEntity.addChild(plane)
        plane.playAnimationWithInifiniteLoop()
        self.plane = plane
        return plane
    }

    func jump() {
        guard let plane, var planeComponent = plane.components[PlaneComponent.self] else {
            print("No plane component")
            return
        }
        if !planeComponent.start {
            planeComponent.start = true
        }
        plane.components.set(planeComponent)

        guard let physicsEntity = plane as? HasPhysics else {
            print("Entity has no physics property")
            return
        }
        physicsEntity.applyLinearImpulse([0, Constants.upImpulse, 0], relativeTo: nil)
    }

    func startSchedulingClouds() {
        guard !isSchedulingClouds else {
            print("Cloud scheduling already running")
            return
        }

        isSchedulingClouds = true
        print("Starting cloud scheduling every 3 seconds")

        let timer = DispatchSource.makeTimerSource(queue: .main)
        timer.schedule(deadline: .now(), repeating: .milliseconds(Constants.cloudSpawnIntervalInMilliSeconds))
        timer.setEventHandler { [weak self] in
            guard let self = self, self.isSchedulingClouds else {
                print("Timer cancelled or GameManager deallocated")
                return
            }
            self.scheduleCloud()
        }
        timer.activate()
        cloudTimer = timer
    }

    func stopSchedulingClouds() {
        print("Stopping cloud scheduling")
        isSchedulingClouds = false
        cloudTimer?.cancel()
        cloudTimer = nil
        for task in tasks {
            task.cancel()
        }
        tasks.removeAll()
        for entity in rootEntity.children {
            entity.removeFromParent()
        }
    }

    private func spawnCloud() -> Entity {
        guard let template = cloudTemplate else {
            fatalError("Cloud template is nil")
        }
        let container = Entity()
        let cloud = template.clone(recursive: true)
        container.addChild(cloud)

        let start = getCloudStartPosition()
        container.position = simd_float(start.vector)
        let animation = generateBoxMovementAnimation(start: start)
        container.playAnimation(animation, transitionDuration: 1.0, startsPaused: false)

        rootEntity.addChild(container)
        return container
    }

    private func getCloudStartPosition() -> Point3D {
        return Point3D(x: Constants.cloudSpawnAndDisappearOffset, y: .random(in: 0.8 ... 1.5), z: -2)
    }

    private func scheduleCloud() {
        let createTask = DispatchWorkItem {
            let cloud = self.spawnCloud()

            let destroyTask = DispatchWorkItem {
                cloud.removeFromParent()
            }
            self.tasks.append(destroyTask)
            DispatchQueue.main.asyncAfter(deadline: .now() + Constants.cloudLifeTime) {
                destroyTask.perform()
            }
        }
        tasks.append(createTask)
        DispatchQueue.main.async {
            createTask.perform()
        }
    }

    private func createCloud() async throws -> ModelEntity {
        let cloud = try await Entity.makeCloud()
        cloud.scale *= 0.1
        return cloud
    }

    private func generateBoxMovementAnimation(start: Point3D) -> AnimationResource {
        let end = Point3D(
            x: start.x - 2 * Constants.cloudSpawnAndDisappearOffset,
            y: start.y,
            z: start.z
        )

        let line = FromToByAnimation<Transform>(
            name: "line",
            from: .init(scale: .init(repeating: 1), translation: simd_float(start.vector)),
            to: .init(scale: .init(repeating: 1), translation: simd_float(end.vector)),
            duration: Constants.cloudLifeTime,
            timing: .linear,
            bindTarget: .transform
        )

        let animation = try! AnimationResource
            .generate(with: line)
        return animation
    }

    // Collision
    func handleCollision(content: RealityViewContent) {
        colisionSubs = content.subscribe(to: CollisionEvents.Began.self) { collisionEvent in
            let a = collisionEvent.entityA
            let b = collisionEvent.entityB
            var cloud: Entity!
            if a.name.hasSuffix("cloud"), b.name == "plane" {
                cloud = a
            } else if a.name == "plane", b.name.hasSuffix("cloud") {
                cloud = b
            } else {
                return
            }
            self.handleHit(cloud: cloud)
        }
    }

    func handleHit(cloud: Entity) {
        guard let parent = cloud.parent,
              let audio = hitAudio,
              let audioEntity = parent.findEntity(named: "SpatialAudio"),
              let particleEmitter = parent.findEntity(named: "ParticleEmitter")
        else {
            return
        }
        parent.stopAllAnimations()
        audioEntity.playAudio(audio)
        particleEmitter.components[ParticleEmitterComponent.self]?.burst()
        cloud.removeFromParent()
        score += 10
    }
}
