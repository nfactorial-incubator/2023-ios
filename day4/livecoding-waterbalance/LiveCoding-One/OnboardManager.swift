//
//  OnboardManager.swift
//  LiveCoding-One
//
//  Created by ablai erzhanov on 07.06.2023.
//

import SwiftUI

class OnboardManager: ObservableObject {
    @Published var isOnboarding: Bool = AppDataAPI.isOnboarding
}
