//
//  OnBoard1.swift
//  Water Balance UI
//
//  Created by Vasiliy Shannikov on 10.12.2021.
//

import SwiftUI

struct OnBoard1: View {
    let headerColor:Color = Color(red: 5.0 / 255, green: 165.0 / 255, blue:239.0 / 255, opacity: 1.0)
    var body: some View {
        VStack {
            Text("WATER BALANCE")
                .font(.system(size: 24, weight: .heavy))
                .italic()
                .foregroundColor(headerColor)
                .padding(.bottom, 62)
                
                
            Text("What is your goal?")
                .font(.system(size: 36))
                //.foregroundColor(.blue)
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(red: 212 / 255, green: 225 / 255, blue: 248 / 255))
                    .frame(width: 358, height: 330)
                VStack {
                    GoalPane(title: "Goal number one")
                    GoalPane(title: "Goal number two")
                    GoalPane(title: "Goal number three")
                    GoalPane(title: "Goal number four")
                }
            }
        Spacer()
            NextButton(title: "Next")// Next buton
        }
        .frame(width: 400, height: 750)
    }
    
}
struct NextButton: View {
    var title: String = ""
    var action: () -> Void = { }
    var body: some View {
        Button (action: action)
        {
            ZStack{
                RoundedRectangle(cornerRadius: 16)
                    .fill(.blue)
                    .frame(width: 358, height: 60)
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 22))
                
            }
        }
    }
}

struct GoalPane: View {
    var title: String
    var body: some View{
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(red: 252 / 255, green: 253 / 255, blue: 255 / 255))
            HStack{
                Text(title)//"Goal Number One"
                    .padding()
                Spacer()
                    
                RadioButton()
                    .frame(width: 18, height: 18)
                    .padding()
            }
        }
        .frame(width: 320, height: 60)
        
    }
}

struct RadioButton: View {
let ifVariable: Bool = true  //the variable that determines if its checked
    let onTapToActive: ()-> Void = {}//action when taped to activate
    let onTapToInactive: ()-> Void = {}//action when taped to inactivate

var body: some View {
    Group{
        if ifVariable {
            ZStack{
                Circle()
                    .fill(Color.blue)
                    .frame(width: 20, height: 20)
                Circle()
                    .fill(Color.white)
                    .frame(width: 8, height: 8)
            }.onTapGesture {self.onTapToInactive()}
        } else {
            Circle()
                .fill(Color.white)
                .frame(width: 20, height: 20)
                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                .onTapGesture {self.onTapToActive()}
        }
    }
}
}
struct OnBoard1_Previews: PreviewProvider {
    static var previews: some View {
        OnBoard1()
    }
}
