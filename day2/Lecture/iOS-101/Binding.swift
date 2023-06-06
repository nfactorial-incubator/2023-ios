//
//  Binding.swift
//  iOS-101
//
//  Created by ablai erzhanov on 04.06.2023.
//

import SwiftUI

////////////////////////////////////////////////////////////////////////////////////////////////////////
// MARK: --------- Binding ---------------------
////////////////////////////////////////////////////////////////////////////////////////////////////////

struct BindingView: View {

    // MARK: - STATE -
    @State var isPlaying: Bool = false

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Text(isPlaying ? "I am playing" : "I am stopped")

            // MARK: - Binding -
            PlayButton(isPlaying: $isPlaying)
        }
        .padding()
    }
}



struct PlayButton: View {
    // MARK: - Binding -
    @Binding var isPlaying: Bool

    var body: some View {
        Button(isPlaying ? "Show" : "Hide") {
            isPlaying.toggle()
        }
    }
}


struct BindingView_Previews: PreviewProvider {
    static var previews: some View {
        BindingView()
    }
}


