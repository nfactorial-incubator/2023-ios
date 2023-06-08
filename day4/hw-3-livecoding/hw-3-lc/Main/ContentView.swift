import SwiftUI
import Moya

struct ContentView: View {
    @State private var memeName = "Cool Obama"
    @State private var topText = "asd"
    @State private var bottomText = "asd"
    
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            memeTextfield
            topTextTextfield
            bottomTextTextfield
            generateButton
        }
        .sheet(isPresented: $viewModel.showingSheet) {
            if let uiImage = viewModel.uiImage {
                Image(uiImage: uiImage)
            }
        }
        .padding()
    }
    
    private var memeTextfield: some View {
        TextField("Meme name", text: $memeName)
            .textFieldStyle(.roundedBorder)
    }
    
    private var topTextTextfield: some View {
        TextField("Top text", text: $topText)
            .textFieldStyle(.roundedBorder)
    }
    
    private var bottomTextTextfield: some View {
        TextField("Bottom text", text: $bottomText)
            .textFieldStyle(.roundedBorder)
    }
    
    private var generateButton: some View {
        Button("Generate") {
            generateMeme()
        }
    }
    
    func generateMeme() {
        let provider = MoyaProvider<MemeService>()
        provider.request(
            .generateMeme(
                name: memeName,
                topText: topText,
                bottomText: bottomText)
        ) { result in
            switch result {
            case let .success(response):
                viewModel.set(data: response.data)
            case .failure:
                break
            }
        }
    }
}
