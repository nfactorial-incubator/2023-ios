import SwiftUI

struct StacksShowcase: View {
    var body: some View {
//        vStack
//        hStack
//        zStack
        combined
//            .frame(height: 350)
            .padding(.horizontal, 100)
    }

    var vStack: some View {
        VStack(alignment: .trailing, spacing: 150) { // by default alignment is .center, and default spacing is 8
            Rectangle()
                .fill(Color.yellow)
            Rectangle()
                .fill(Color.blue)
                .frame(width: 300)
            Rectangle()
                .fill(Color.red)
        }
    }

    var hStack: some View {
        HStack(alignment: .center, spacing: 81) { // by default alignment is .center, and default spacing is 8
            Rectangle()
                .fill(Color.yellow)
            Rectangle()
                .fill(Color.blue)
                .frame(height: 100)
            Rectangle()
                .fill(Color.red)
        }
    }

    var zStack: some View {
        ZStack(alignment: .topLeading) { // by default alignment is .center in both directions
            Rectangle()
                .fill(Color.yellow)
                .frame(width: 300, height: 300)
            Rectangle()
                .fill(Color.blue)
                .frame(width: 200, height: 200)
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
        }
    }

    var combined: some View {
        VStack {
            Group {
                HStack(spacing: 20) {
                    Text("Username")
                    TextField("username", text: .constant(""))
                }
                HStack(spacing: 20) {
                    Text("Password")
                    SecureField("password", text: .constant(""))
                }
            }
            .textFieldStyle(.roundedBorder)
            Button(action: {}) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                    Text("Sign in")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
            }
            .frame(height: 52)
            HStack {
                Spacer()
                Button(action: {}) {
                    Text("Forgot password?")
                }
                Spacer()
            }
            .padding(.vertical, 8)
        }
    }
}

struct StacksShowcase_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StacksShowcase()
        }
    }
}
