//
//  HistoryScreen.swift
//  nFactorial-LiveCoding-One
//
//  Created by ablai erzhanov on 05.06.2023.
//

import SwiftUI



struct HistoryScreen: View {
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("HISTORY")
                .foregroundColor(Color(red: 0.02, green: 0.647, blue: 0.937))
                .italic()
                .font(.system(size: 24))
                .fontWeight(.black)
                .padding(.top, 56)
            
            
            Spacer()
            
            List {
                Section {
                    HStack{
                        Text("250 ml")
                        Spacer()
                        Text("12:17")
                            .foregroundColor(Color(red: 0.235, green: 0.235, blue: 0.263)).opacity(0.6)
                    }
                    
                    HStack{
                        Text("300 ml")
                        Spacer()
                        Text("14:34")
                            .foregroundColor(Color(red: 0.235, green: 0.235, blue: 0.263)).opacity(0.6)
                    }
                    
                    HStack{
                        Text("500 ml")
                        Spacer()
                        Text("18:23")
                            .foregroundColor(Color(red: 0.235, green: 0.235, blue: 0.263)).opacity(0.6)
                    }
                    
                    HStack{
                        Text("100 ml")
                        Spacer()
                        Text("20:51")
                            .foregroundColor(Color(red: 0.235, green: 0.235, blue: 0.263)).opacity(0.6)
                    }
                } header: {
                    Text("Today")
                }
                
                Section {
                    HStack{
                        Text("100 ml")
                        Spacer()
                        Text("10:06")
                            .foregroundColor(Color(red: 0.235, green: 0.235, blue: 0.263)).opacity(0.6)
                    }
                    
                    HStack{
                        Text("450 ml")
                        Spacer()
                        Text("11:49")
                            .foregroundColor(Color(red: 0.235, green: 0.235, blue: 0.263)).opacity(0.6)
                    }
                    
                    HStack{
                        Text("250 ml")
                        Spacer()
                        Text("18:23")
                            .foregroundColor(Color(red: 0.235, green: 0.235, blue: 0.263)).opacity(0.6)
                    }
                    
                    HStack{
                        Text("200 ml")
                        Spacer()
                        Text("21:17")
                            .foregroundColor(Color(red: 0.235, green: 0.235, blue: 0.263)).opacity(0.6)
                    }
                } header: {
                    Text("04.06.2023")
                }

            }
            .listStyle(.inset)
        }
        .padding([.leading, .trailing], 16)
        .background(Color(red: 0.988, green: 0.992, blue: 1))
    }
}

struct HistoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        HistoryScreen()
    }
}
