//
//  ChatViewModel.swift
//  ChatApp
//
//  Created by ablai erzhanov on 09.06.2023.
//

import Foundation
import Chat


struct CustomUser {
    static let userOne = User(id: "1", name: "John", avatarURL: nil, isCurrentUser: true)
    static let userTwo = User(id: "2", name: "Jessica", avatarURL: nil, isCurrentUser: false)
}

class  ChatViewModel: ObservableObject {
    
    var messages: [Message] = [Message(id: "1", user: CustomUser.userOne, text: "Hello it's first Chat message"),
                               Message(id: "2", user: CustomUser.userTwo, text: "Hello it's second message"),
                               Message(id: "3", user: CustomUser.userOne, text: "short message"),
                               Message(id: "4", user: CustomUser.userOne, text: "Long message Long message Long message Long message Long message Long message Long message Long message Long message Long message Long message"),
                               Message(id: "5", user: CustomUser.userTwo, text: "Just a reply"),
                               Message(id: "6", user: CustomUser.userTwo, text: "Hello it's second message"),
                               Message(id: "7", user: CustomUser.userOne, text: "Hello it's second message"),
                               Message(id: "8", user: CustomUser.userTwo, text: "Hello it's second message")
    ]
}
