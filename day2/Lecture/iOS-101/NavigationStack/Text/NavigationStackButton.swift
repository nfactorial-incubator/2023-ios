//
//  NavigationStackButton.swift
//  iOS-101
//
//  Created by ablai erzhanov on 04.06.2023.
//

import SwiftUI

struct NavigationStackDemo: View {
    
    enum Target {
        case subView1,subView2
    }
    
    var body: some View {
        NavigationStack {
            List {
//                Text("SubView 1")
                NavigationLink("SubView1", value: Target.subView1) // Only declare the associated state value
                NavigationLink("SubView2", value: Target.subView2)
                NavigationLink("SubView3", value: 3)
                NavigationLink("SubView4", value: 4)
            }
            .navigationDestination(for: Target.self){ target in // Uniformly handle the same type and return the target view
                switch target {
                    case .subView1:
                        SubView1()
                    case .subView2:
                        SubView2()
                }
            }
            .navigationDestination(for: Int.self) { target in  // Add multiple handling modules for different types
                switch target {
                case 3:
                    SubView3()
                default:
                    SubView4()
                }
            }
        }
    }
}

struct NavigationStackDemo_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackDemo()
    }
}
