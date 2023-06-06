//
//  History.swift
//  Water Balance UI
//
//  Created by Vasiliy Shannikov on 12.12.2021.
//

import SwiftUI

struct History: View {
    let headerColor:Color = Color(red: 5.0 / 255, green: 165.0 / 255, blue:239.0 / 255, opacity: 1.0)
    
    var body: some View {
        VStack{
            Text("TODAY")
                .font(.system(size: 17,weight: .heavy))
                .italic()
                .foregroundColor(headerColor)
                .padding(.top,28)
            historyItem(sign: "250 ml", val: "12:13")
            separator
            historyItem(sign: "200 ml", val: "14:10")
            separator
            historyItem(sign: "50 ml",val: "15:13")
            separator
            historyItem(sign: "300 ml",val: "19:10")
            separator
            Spacer()
        }
    }
    var separator: some View {
        Rectangle()
            .frame(width: 350, height: 0.0, alignment: .center)
            .padding()
    }
}
struct historyItem: View {
    var sign: String = ""
    var val: String = "    "
    var body: some View{
        HStack {
            Text(sign)
                .frame(width: 309, height: 22, alignment: .leading)
            Text(val)
                .frame(width: 41, height: 22, alignment: .leading)
            //RightButton()
        }
    }
}
struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
