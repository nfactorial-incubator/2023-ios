//
//  OnBoard3.swift
//  Water Balance UI
//
//  Created by Vasiliy Shannikov on 10.12.2021.
//

import SwiftUI

struct OnBoard3: View {
    let headerColor:Color = Color(red: 5.0 / 255, green: 165.0 / 255, blue:239.0 / 255, opacity: 1.0)
    var body: some View {
        VStack{
            LeftButton()
                .padding(.bottom,29)
                .padding(.trailing,350
                )
            Text("WATER BALANCE")
                .font(.system(size: 24))
                .italic()
                .fontWeight(.black)
                .foregroundColor(headerColor)
                .padding(.bottom, 62)
            
            Text("What is your goal?")
                .font(.system(size: 36))
            ZStack{
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(red: 212 / 255, green: 225 / 255, blue: 248 / 255))
                    .frame(height: 108)
                
               
                HStack(alignment: .center, spacing: 0) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color( red: 252, green: 253, blue: 255, opacity: 1))
                            .frame(height: 60)
                        TextField("something", text: .constant("2400"))
                            .foregroundColor(.blue)
                            .disableAutocorrection(true)
                            .textFieldStyle(.roundedBorder)
                            .font(.system(size: 16))
                            .frame(width: 250, height: 60)
                            .multilineTextAlignment(.center)
                      
                    }
                   
                    Spacer()
                    Text("ML")
                        .padding(.trailing, 43)
                }
                .padding(.leading,19)
            }
            .padding(.bottom, 77)
            .padding(.horizontal, 19)
            NextButton(title: "Save")
          Spacer()
        }
        .frame(width: 400, height: 780)
    }
}

struct OnBoard3_Previews: PreviewProvider {
    static var previews: some View {
        OnBoard3()
    }
}
