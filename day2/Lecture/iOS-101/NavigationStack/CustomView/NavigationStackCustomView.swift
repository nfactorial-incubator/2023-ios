//
//  NavigationStackCustomView.swift
//  iOS-101
//
//  Created by ablai erzhanov on 04.06.2023.
//

import SwiftUI

enum Target {
    case subView1,subView2
}


struct NavigationStackCustomView: View {
    
    @State var showModalView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                CustomImage()
                CustomButton()
                    .padding(.top, 60)
                
                Button {
                    showModalView.toggle()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16).foregroundColor(.blue)
                        
                        Text("Show modal presentation")
                            .foregroundColor(.white)
                    }
                    .frame(height: 60)
                    .padding(.horizontal, 16)
                }
                .sheet(isPresented: $showModalView) {
                    SubView1()
                }

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


struct CustomImage: View {
    var body: some View {
        NavigationLink(value: Target.subView1) {
            Image(systemName: "bell")
        }
    }
}

struct CustomButton: View {
    var body: some View {
        Button {
            print("asd")
        } label: {
            NavigationLink(value: 3) {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.blue)
                    Text("NEXT")
                        .foregroundColor(.white)
                }
               .frame(height: 60)
            }
        }

    }
}


struct NavigationStackCustomView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackCustomView()
    }
}
