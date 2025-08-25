// Created by Chester for MSC in 2025

import SwiftUI

struct Program: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let text: String
    let imageName: String
}

struct ProgramView: View {
    @State var current: Program?

    var body: some View {
        NavigationSplitView {
            // 左侧列表
            List(progams, selection: $current) { program in
                NavigationLink(program.title, value: program)
            }
            .padding(.top, 20)
            .padding(.leading, 20)
        } detail: {
            // 右侧详细内容
            if let current {
                ScrollView {
                    VStack {
                        Text(current.title)
                            .font(.title)
                            .padding()

                        Divider()

                        Image(current.imageName)
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 400, height: 400)
                            .clipped()
                            .padding()

                        Text(current.text)
                            .padding()

                        Spacer()
                    }
                }
            } else {
                Text("不OK")
            }
        }
        .onAppear {
            if current == nil {
                current = progams[0]
            }
        }
    }
}

let progams = [
    Program(title: "企鵝與熊一招半式上太空3D", text: """
    來自南極，夢想成為科學家的企鵝阿占與來自北極、古靈精怪的北極熊大舊在北極海冰上相遇。他們成為了好朋友，時常談及各自的家鄉、一起觀察星星和探討神秘的「永晝和永夜」現象。
    """, imageName: "1_Penguin"),
    Program(title: "达尔文", text: """
    究竟這兩位新手天文學家會怎樣透過推理和觀察來解開這個謎團呢？憑著阿占的科學頭腦和大舊的創意發明天賦，他們先後成功建造了天文台和太空飛船。在一次環繞地球、足跡遠至火星和土星的旅程中，他們終於得到了答案，還發現了其他行星之間的異同。
    """, imageName: "2_Darwin"),
    Program(title: "外星特遣隊3D", text: """
    來自外太空的「外星特遣隊」―機智冷靜的Imani、活潑貪玩的Aki和温柔憨直的John，在執行日常任務時，因偷懶讓太空船墜落地球！這次事故讓太空船上珍貴的森林生命系統損壞！由於三個外星人對「養植物」一竅不通，於是向天文館的小朋友及觀眾尋救援助，一同重建外星森林的生態系統。
    """, imageName: "3_Stellars"),
    Program(title: "榛果星計劃3D", text: """
    森林裏有兩隻貪吃的小松鼠—— Nino 和 Lilli ，牠們為了尋找傳說中的榛果而開始了一趟冒險之旅。一顆超級巨大的榛果可能就在地球以外的某一顆星球上，牠們想盡一切辦法，千方百計飛上太空，踏上尋找榛果的旅程。
    """, imageName: "4_Nuts"),
]
