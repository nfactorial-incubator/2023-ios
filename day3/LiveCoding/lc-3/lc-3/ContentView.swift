//
//  ContentView.swift
//  lc-3
//
//  Created by Beknar Danabek on 07.06.2023.
//

import SwiftUI
import Moya

enum ContentViewState {
    case loading
    case joke(joke: Joke)
}

struct ContentView: View {
    @State private var state: ContentViewState = .loading
    
    var body: some View {
        VStack {
            switch state {
            case .loading:
                ProgressView()
            case .joke(let joke):
                Text("Dad joke is:")
                Text(joke.joke)
            }
        }
        .padding()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                fetchJoke()
            }
        }
    }
    
    func fetchJoke() {
        let provider = MoyaProvider<JokeService>()
        provider.request(.jokeById(id: "R7UfaahVfFd")) { result in
            switch result {
            case let .success(response):
                do {
                    let joke = try response.map(Joke.self)
                    self.state = .joke(joke: joke)
                } catch {
                    
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
//    func fetchJoke() {
//        let url = URL(string: "https://icanhazdadjoke.com/")!
//
//        let session = URLSession.shared
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//
//        let task = session.dataTask(
//            with: request) { data, response, error in
//                if let error = error {
//                    text = "Error: \(error)"
//                    return
//                }
//
//                if let data = data {
//                    do {
//                        let joke = try JSONDecoder().decode(Joke.self, from: data)
//                        self.text = joke.joke
//                    } catch {
//                        print(error)
//                    }
//                }
//            }
//
//        task.resume()
//    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
