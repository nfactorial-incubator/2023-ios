import Foundation
import UIKit

class HistoryImagesService {
    private enum Constants {
        static let userDefaultsKey = "storedImagesData"
    }
    
    func save(images: [UIImage]) {
        let imagesData = images.map { $0.pngData() }.compactMap { $0 }
        UserDefaults.standard.set(imagesData, forKey: Constants.userDefaultsKey)
    }
    
    func getImages() -> [UIImage] {
        if let dataArray = UserDefaults.standard.object(forKey: Constants.userDefaultsKey) as? [Data] {
            let images = dataArray.map { UIImage(data: $0) }.compactMap { $0 }
            return images
        }
        return []
    }
}
