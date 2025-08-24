// Created by Chester for MacaoScienceCenter in 2025

import SwiftUI

struct Program: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var imageName: String
    var description: String
}

struct ProgramView: View {
    @State var currentProgram: Program?

    var body: some View {
        NavigationSplitView {
            List(programs, selection: $currentProgram) { program in
                NavigationLink(program.title, value: program)
            }
            .padding(.top, 16)
        } detail: {
            if let currentProgram {
                ProgramDetailView(program: currentProgram)
                    .padding()
            } else {
                Text("HEY")
            }
        }
        .navigationSplitViewStyle(.prominentDetail)
        .onAppear {
            if currentProgram == nil {
                currentProgram = programs[0]
            }
        }
    }
}

struct ProgramDetailView: View {
    let program: Program
    var body: some View {
        ScrollView {
            VStack {
                Text(program.title)
                    .font(.title)
                    .padding()
                
                Divider()
                
                Image(program.imageName)
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 400)
                    .clipped()
                    .padding()
                
                Text(program.description)
                    .padding()
                
                Spacer()
            }
        }
    }
}

let programs = [
    Program(title: "企鵝與熊一招半式上太空3D", imageName: "1_Penguin", description: """
    片長：29分鐘
    簡介：
    來自南極，夢想成為科學家的企鵝阿占與來自北極、古靈精怪的北極熊大舊在北極海冰上相遇。他們成為了好朋友，時常談及各自的家鄉、一起觀察星星和探討神秘的「永晝和永夜」現象。
    究竟這兩位新手天文學家會怎樣透過推理和觀察來解開這個謎團呢？憑著阿占的科學頭腦和大舊的創意發明天賦，他們先後成功建造了天文台和太空飛船。在一次環繞地球、足跡遠至火星和土星的旅程中，他們終於得到了答案，還發現了其他行星之間的異同。
    語言：粵語、普通話、韓語、英語
    組別：A組
    """),
    Program(title: "說故事劇場—生命之樹：達爾文", imageName: "2_Darwin", description: """
    故事特色：以肢體方式呈現達爾文由出生、長大，以及登上小獵犬號進行為期五年的航海旅程故事。演出中只使用小量道具，以及大量觀眾的創意與想像，一同構建在這個說故事劇場裏面。
    在劇中你會了解到達爾文的生平故事，明白物競天擇、自然選擇理論，以及生物多樣性是怎樣出現的?
    演出長度：25-30分鐘
    適合年齡：K3至初中，有興趣人士（會按年齡調整內容）
    演出語言：粵語
    演出地點：5號展廳
    演出時間：科普劇場時間表
    """),
    Program(title: "外星特遣隊3D", imageName: "3_Stellars", description: """
    片長：26分鐘
    簡介：
    來自外太空的「外星特遣隊」―機智冷靜的Imani、活潑貪玩的Aki和温柔憨直的John，在執行日常任務時，因偷懶讓太空船墜落地球！這次事故讓太空船上珍貴的森林生命系統損壞！由於三個外星人對「養植物」一竅不通，於是向天文館的小朋友及觀眾尋救援助，一同重建外星森林的生態系統。
    影片情節之中，將邀請觀眾一起動腦解謎。通過輕鬆生動的表達手法讓觀眾了解植物生存的要素—從土壤養分到光合作用，從森林生態到合作精神。知識點化身冒險關卡，讓觀眾邊玩邊學！
    《外星特遣隊3D》讓我們相信：每一個小小行動，都能改變宇宙！
    語言：粵語、普通話、英語
    組別：A組
    """),
    Program(title: "榛果星計劃3D", imageName: "4_Nuts", description: """
    片長：25分鐘
    簡介：
    森林裏有兩隻貪吃的小松鼠—— Nino 和 Lilli ，牠們為了尋找傳說中的榛果而開始了一趟冒險之旅。一顆超級巨大的榛果可能就在地球以外的某一顆星球上，牠們想盡一切辦法，千方百計飛上太空，踏上尋找榛果的旅程。
    旅程中，牠們了解觀察太陽系中各顆行星，還與大家一起探討了很多話題，比如適居帶、大氣的基本作用，以及地球演化形成的不同階段。
    語言：粵語、普通話及英語
    組別：A組
    """),
]

#Preview {
    ProgramView()
}
