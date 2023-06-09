//
//  ContentView.swift
//  ChatApp
//
//  Created by ablai erzhanov on 09.06.2023.
//

import SwiftUI
import Chat

struct ContentView: View {
    
    @ObservedObject var viewModel = ChatViewModel()
    
    var body: some View {
        VStack {
            ChatView(messages: viewModel.messages) { draft in
                //                    viewModel.send(draft: draft)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
