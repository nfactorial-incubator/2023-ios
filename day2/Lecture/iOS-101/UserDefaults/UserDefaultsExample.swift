//
//  UserDefaultsExample.swift
//  iOS-101
//
//  Created by ablai erzhanov on 06.06.2023.
//

import SwiftUI

struct UserDefaultsExample: View {
    @State var isOnboarding: Bool = false
    var body: some View {

        switch isOnboarding {
        case true :
            Text("Hello, It's Onboarding!")
                .onTapGesture {
                    self.isOnboarding = false
                    AppDataAPI.isOnboarding = false
                }
        case false :
            Text("Hello, It's not Onboarding!")
                .onTapGesture {
                    self.isOnboarding = true
                    AppDataAPI.isOnboarding = true
                }
        }
        
    }
}

struct UserDefaultsExample_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultsExample()
    }
}
