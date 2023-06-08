import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var showingSheet = false
    
    var uiImage: UIImage? {
        guard let data = data else { return nil }
        
        return UIImage(data: data)
    }
    
    private var data: Data? {
        didSet {
            if data != nil {
                showingSheet = true
            } else {
                showingSheet = false
            }
        }
    }
    
    @ObservedObject private var historyViewModel: HistoryViewModel
    
    init(historyViewModel: HistoryViewModel) {
        self.historyViewModel = historyViewModel
    }
    
    func set(data: Data) {
        self.data = data
        if let uiImage = uiImage {
            historyViewModel.images.append(uiImage)
        }
    }
}
