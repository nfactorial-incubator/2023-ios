import Foundation

struct Joke: Decodable {
    let id: String
    let joke: String
    let status: Int
}
