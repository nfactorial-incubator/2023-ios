//
//  GestureRecognizer.swift
//  iOS-101
//
//  Created by ablai erzhanov on 04.06.2023.
//

import SwiftUI

struct TapGestureExample: View {
    
    let colors: [Color] = [.gray, .red, .orange, .yellow,
                           .green, .blue, .purple, .pink]
    @State private var fgColor: Color = .gray

    var body: some View {
        Image(systemName: "heart.fill")
            .resizable()
            .frame(width: 200, height: 200)
            .foregroundColor(fgColor)
            .onTapGesture(count: 2) {
                // MARK: - Unwrapping of Optional-
                if let randomColor = colors.randomElement() {
                    fgColor = randomColor
                }
//                fgColor = colors.randomElement()
            }
    }
}

struct TapGestureExampleb_Previews: PreviewProvider {
    static var previews: some View {
        TapGestureExample()
    }
}
