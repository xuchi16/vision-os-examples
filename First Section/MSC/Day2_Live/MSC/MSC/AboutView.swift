// Created by Chester for MSC in 2025

import SwiftUI

struct AboutView: View {
    // 1. 获取 openURL 扳手
    @Environment(\.openURL) var openURL
    
    var body: some View {
        ScrollView {
            VStack {
                Text("本館介紹")
                    .font(.title)
                    .padding()

                Divider()

                Image("MSC")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 536, height: 402)
                    .padding()

                Text(mscDescription)
                    .padding()
            }
            .padding()
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomOrnament) {
                // Content 需要展示的内容

                Button {
                    // 行为
                    // 2. 通过扳手打开页面
                    openURL(URL(string: "https://www.facebook.com/MacaoScienceCenter")!)
                } label: {
                    // 展示
                    Image("fb_white")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                }

                Button {
                    // 行为
                    openURL(URL(string: "https://www.douyin.com/user/MS4wLjABAAAAaUwb8vGBxk8ioL5kjFLg5aVDgjH5kkiRRGe6wHizjiM")!)
                } label: {
                    // 展示
                    Image("tiktok_white")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                }

                Button {
                    // 行为
                    openURL(URL(string: "https://x.com/mscmacao")!)
                } label: {
                    // 展示
                    Image("x_white")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                }
            }
        }
    }
}

let mscDescription = """
澳門科學館以推動本澳青少年科普教育、作為地標性建築配合澳門旅遊發展、作爲地區性科普教育及會展平台及推動高新科技及科學傳播為宗旨。

澳門科學館繼2022年3月及5月先後獲中國科協列入“全國科普教育基地”及“科學家精神教育基地”，充分體現了國家對澳門科普教育、科學家精神教育工作的支持及肯定。同年12月底，本館獲批加入中國科技文化場館聯合體，更有利於融入國家發展大局，推動科技文化融合創新發展。2023年，澳門科學館獲評為科技部國家重點研發計劃應用示範基地，體現了國家對澳門科學館的節能減碳工作及環保科普教育的支持及肯定。2024年3月，澳門科學館獲中國城市科學研究會頒授“綠色、低碳”科普教育基地牌匾，該項殊榮肯定了澳門科學館在推廣環境保護和可持續發展方面所作出的努力。

本館佔地面積約為22,000平方米，由三部分組成。最高並呈斜錐體形的為展覽中心，當中14個展廳呈螺旋上升狀分佈；半球形建築物為天文館，旁邊是會議中心及辦公室。館内亦設有禮品店、餐廳及育嬰室等，為參觀者提供完善的服務。

展覽中心內14個展廳連中庭的總面積約5,800平方米。13個長期展廳主題包括天文科學、兒童樂園、兒童科學、航海科學、生物多樣性、智能科技、聲學、物理力學、中國科學家精神、可持續發展廳、數據科學和電學及電磁學廳。其餘一個為適時更換的專題展覽廳。展覽以知識性、科學性和趣味性並重的互動展品為主，讓參觀者從親自動手的過程中享受探索科學的樂趣。

本館亦設有多個共享實驗室包括：獲中國國際經濟技術合作促進會航空航天科技工作委員會及中國航天電子技術研究院衛星導航系統工程中心聯合授牌的 “北斗衛星系統科普國際實驗室”／數字化製造實驗室（FABLAB），及獲中國電子信息產業集團授牌的“澳門信息技術應用創新實驗室”／網絡實驗室（NetLab）、創客空間（Maker Space）及探客空間／科普閱讀天地（Tinker Space），讓學生的科創想法和概念轉換為現實，並通過主動探索、動手、實踐、創新設計、跨學科整合、問題導向、活動探究、項目化學習體驗等的學習方式獲取新知識。

澳門科學館天文館曾榮獲健力士世界紀錄大全列為全球最高解像度的立體天文館。館内設有一個直徑約15.24米的傾斜半球形銀幕，是全球首個同時具備8K以及3D視覺效果的數碼球幕播放系統。現在由6台超高解像度的4K激光投影機組成，並由12台高效能電腦同步處理數碼圖像。天文館有127個座位及 4個輪椅使用者專用座位，全部均配備互動控制按鈕。館内設置的龐大資料庫及放映效果，可讓觀眾自由地穿梭於宇宙星辰之中。當觀眾佩戴上特殊的眼鏡設備，更可看到投射於巨型圓頂螢幕上的立體影像。此套設備亦可放映數碼化的球幕影片，使天文館成為多功能的球幕影院。

會議中心由一個多功能會議廳及四個會議室組成，其中兩個會議室可按需要變成一個大會議室。會議廳可容納500人進行會議，亦可以安排約240人的宴會。此廳備有專業電影放映設備、音響系統、即時傳譯系統及視像會議設備等，適合舉辦不同類型的科普及教育會議、講座、研討會及頒獎禮。
"""

#Preview {
    AboutView()
}
