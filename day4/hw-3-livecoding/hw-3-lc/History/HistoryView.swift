import SwiftUI

struct HistoryView: View {
    @ObservedObject var viewModel: HistoryViewModel
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.images, id: \.self) { image in
                Image(uiImage: image)
            }
        }

    }
    
    private func appDidEnterBackground() {
        viewModel.appDidEnterBackground()
    }
}
