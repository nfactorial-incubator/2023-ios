import SwiftUI

struct ButtonShowcase: View {
    var body: some View {
//        textButton
        imageButton
    }
    
    var textButton: some View {
        Button("Dalida") {
            print("button pressed")
        }
    }
    
    var imageButton: some View {
        Button {
            print("something happened!")
        } label: {
            Image("everything-is-fine-dog")
                .resizable() // so that we can change it's size
                .aspectRatio(contentMode: .fit) // fill vs fit
                .frame(width: 400, height: 500) // setting the custom size
                .border(.blue, width: 5)
        }
    }
}

struct ButtonShowcase_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ButtonShowcase()
        }
    }
}
