import Moya
import Foundation

enum JokeService {
    case randomJoke
    case jokeById(id: String)
}

extension JokeService: TargetType {
    var baseURL: URL {
        URL(string: "https://icanhazdadjoke.com/")!
    }
    
    var path: String {
        switch self {
        case .randomJoke:
            return ""
        case .jokeById(let id):
            return "/j/\(id)"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Moya.Task {
        .requestPlain
    }
    
    var headers: [String : String]? {
        ["Accept": "application/json"]
    }
}
