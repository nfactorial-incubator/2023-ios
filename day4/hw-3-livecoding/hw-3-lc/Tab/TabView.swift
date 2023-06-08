import Foundation
import SwiftUI

struct AppTabView: View {
    @ObservedObject var historyViewModel: HistoryViewModel
    @ObservedObject var contentViewModel: ContentViewModel
    
    init() {
        let historyViewModel = HistoryViewModel()
        self.historyViewModel = historyViewModel
        contentViewModel = ContentViewModel(historyViewModel: historyViewModel)
    }

    var body: some View {
        TabView {
            ContentView(viewModel: contentViewModel)
                .tabItem {
                    Image(systemName: "house")
                    Text("Main")
                }
            HistoryView(viewModel: historyViewModel)
                .tabItem {
                    Image(systemName: "folder")
                    Text("History")
                }
        }
    }
}
