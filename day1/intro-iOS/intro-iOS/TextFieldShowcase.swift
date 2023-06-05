import SwiftUI

struct TextFieldShowcase: View {
    var body: some View {
//        plain
         secure
            .padding()
    }

    var plain: some View {
        TextField("something", text: .constant("fkfjgkdf"))
            .disableAutocorrection(true)
            .textFieldStyle(.roundedBorder)
    }

    var secure: some View {
        SecureField("password", text: .constant("asdasd123!"))
            .textFieldStyle(.roundedBorder)
    }
}

struct TextFieldShowcase_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TextFieldShowcase()
        }
    }
}
