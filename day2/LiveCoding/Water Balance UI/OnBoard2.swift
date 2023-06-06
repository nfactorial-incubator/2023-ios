//
//  OnBoard2.swift
//  Water Balance UI
//
//  Created by Vasiliy Shannikov on 10.12.2021.
//

import SwiftUI

struct OnBoard2: View {
    let headerColor:Color = Color(red: 5.0 / 255, green: 165.0 / 255, blue:239.0 / 255, opacity: 1.0)
    var body: some View {

        VStack {
            LeftButton()
                .padding(.bottom,29)
                .padding(.trailing,350
                )
            
            Text("WATER BALANCE")
                .font(.system(size: 24, weight: .black))
                .italic()
                .foregroundColor(headerColor)
                .padding(.bottom, 62)
            
         

            Text("Remind me each")
                .font(.system(size: 36))
                .padding(.bottom,32)
            ZStack{
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(red: 212 / 255, green: 225 / 255, blue: 248 / 255))
                    .frame(width: 358, height: 330)
                VStack{
                    HStack{
                        RemindButton(title: "15 minutes")
                        RemindButton(title: "30 minutes")
                    }
                    HStack{
                        RemindButton(title: "45 minutes")
                        RemindButton(title: "1 hour")
                    }
                    HStack{
                        RemindButton(title: "1,5 hours")
                        RemindButton(title: "2 hours")
                    }
                    HStack{
                        RemindButton(title: "3 hours")
                        RemindButton(title: "4 hours")
                    }
                }
            }
            .padding(.bottom,116)
       NextButton(title: "Next")// Next buton
        }
    }
}
struct LeftButton: View {
    var action: () -> Void = { }
    var body: some View{
        Button(action: action)
        {
            Image(systemName: "chevron.left")
                .foregroundColor(.blue)
        }
    }
}
struct RemindButton: View {
    var title: String = ""
    var action: () -> Void = { }
    var body: some View {
        Button (action: action)
        {
            ZStack{
                RoundedRectangle(cornerRadius: 16)
                    .fill(.white)
                    .frame(width: 150, height: 60)
                Text(title)
                    .foregroundColor(.black)
                    .font(.system(size: 22))
                
            }
        }
    }
}
struct OnBoard2_Previews: PreviewProvider {
    static var previews: some View {
        OnBoard2()
    }
}
