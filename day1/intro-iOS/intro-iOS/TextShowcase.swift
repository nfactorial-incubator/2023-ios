import SwiftUI

struct TextShowcase: View {
    var body: some View {
//        plain
        markdown
    }
    
//    var plain: some View {
//        Text("Hello, world!")
//            .font(.system(size: 120, weight: .bold))
//            .foregroundColor(.red)
//            .lineSpacing(20)
//            .multilineTextAlignment(.trailing)
//    }

    // To learn markdown -> https://www.markdowntutorial.com
    var markdown: some View {
        VStack {
            Text("This is regular text.")
            Text("* This is **bold** text, this is *italic* text, and this is ***bold, italic*** text.")
            Text("~~A strikethrough example~~")
            Text("`Monospaced works too`")
            Text("Visit Apple: [click here](https://apple.com)")
            }
    }
}

struct TextShowcase_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TextShowcase()
        }
    }
}
