import Foundation
import SwiftUI

class HistoryViewModel: ObservableObject {
    @Published var images: [UIImage] = []
    
    private let service = HistoryImagesService()
    
    init() {
        images = service.getImages()
    }
    
    func appDidEnterBackground() {
        service.save(images: images)
    }
}
