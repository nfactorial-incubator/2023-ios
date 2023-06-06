//
//  Settings.swift
//  Water Balance UI
//
//  Created by Vasiliy Shannikov on 11.12.2021.
//

import SwiftUI

struct Settings: View {
    let headerColor:Color = Color(red: 5.0 / 255, green: 165.0 / 255, blue:239.0 / 255, opacity: 1.0)
    var body: some View {
        VStack{
            Text("EDIT")
                .font(.system(size: 17,weight: .black))
                .italic()
                .foregroundColor(headerColor)
                .padding(.top,28)
            settingsItem(sign: "Daily intake level", val: "240ML")
            separator
            settingsItem(sign: "Your goal")
            separator
            settingsItem(sign: "Reminder")
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
struct settingsItem: View {
    var sign: String = ""
    var val: String = "    "
    var body: some View{
        HStack {
            Text(sign)
                .frame(width: 260, height: 22, alignment: .leading)
            Text(val)
                .frame(width: 60, height: 22, alignment: .leading)
            RightButton()
        }
    }
}
struct RightButton: View {
    let rightArrowColor = Color(red: 60.0 / 255, green: 60.0 / 255, blue:67.0 / 255, opacity: 0.3)
    var action: () -> Void = { }
    var body: some View{
        Button(action: action)
        {
            Image(systemName: "chevron.right")
                .foregroundColor(rightArrowColor)
        }
    }
}
struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
