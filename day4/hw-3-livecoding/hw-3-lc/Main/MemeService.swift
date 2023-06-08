import Foundation
import Moya

enum MemeService {
    case generateMeme(name: String, topText: String, bottomText: String)
}

extension MemeService: TargetType {
    var baseURL: URL {
        URL(string: "https://apimeme.com/")!
    }
    
    var path: String {
        "meme"
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Moya.Task {
        switch self {
        case let .generateMeme(name, topText, bottomText):
            let parameters: [String: Any] = [
                "meme": name,
                "top": topText,
                "bottom": bottomText
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        [:]
    }
}
