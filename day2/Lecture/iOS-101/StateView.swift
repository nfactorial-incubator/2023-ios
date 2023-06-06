//
//  ContentView.swift
//  iOS-101
//
//  Created by ablai erzhanov on 04.06.2023.
//

import SwiftUI

////////////////////////////////////////////////////////////////////////////////////////////////////////
// MARK: --------- State -----------------------
////////////////////////////////////////////////////////////////////////////////////////////////////////

struct StateView: View {
    
    // MARK: - STATE -
    @State var isShow: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            // MARK: - STATE -
            Button(isShow ? "Show" : "Hide") {
                isShow.toggle()
            }
        }
        .padding()
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView()
    }
}



