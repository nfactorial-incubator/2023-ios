import SwiftUI

struct ImageShowcase: View {
    var body: some View {
//        assetImage
        sfSymbolImage
    }
    
    var assetImage: some View {
        Image("everything-is-fine-dog")
            .resizable() // so that we can change it's size
            .aspectRatio(contentMode: .fit) // fill vs fit
            .frame(width: 300, height: 300) // setting the custom size
    }
    
    var sfSymbolImage: some View {
        Image(systemName: "eyes")
            .font(.largeTitle)
            .foregroundColor(.accentColor)
    }
}

struct ImageShowcase_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ImageShowcase()
        }
    }
}
