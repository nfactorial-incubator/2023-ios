//
//  ScreenOne.swift
//  LiveCoding-One
//
//  Created by ablai erzhanov on 05.06.2023.
//


import SwiftUI

struct ScreenOne: View {
    var body: some View {
        VStack {
            Text("WATER BALANCE")
                .foregroundColor(Color(red: 0.02, green: 0.647, blue: 0.937))
                .italic()
                .font(.system(size: 24))
                .fontWeight(.black)
                .padding(.top, 108)
            
            Text("What is your goal?")
                .foregroundColor(Color(red: 0.185, green: 0.183, blue: 0.201))
                .font(.system(size: 36))
                .fontWeight(.semibold)
                .padding(.top, 62)
            
            
            GoalsView()
                .padding(.top, 32)
            
            Spacer()
            
            CustomButton()
        }
        .padding([.leading, .trailing], 16)
        .background(Color(red: 0.988, green: 0.992, blue: 1))
    }
}

struct ScreenOne_Previews: PreviewProvider {
    static var previews: some View {
        ScreenOne()
    }
}



struct GoalsView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color(red: 0.833, green: 0.882, blue: 0.972))
            
            VStack(alignment: .center, spacing: 14) {
                ChoiceGoalCustom(title: "Goal Number One", selected: true)
                ChoiceGoalCustom(title: "Goal Number Tewo", selected: false)
                ChoiceGoalCustom(title: "Goal Number Three", selected: false)
                ChoiceGoalCustom(title: "Goal Number Four", selected: false)
                
            }
            .padding(.horizontal, 19)
            .padding([.top, .bottom], 24)
        }
        .frame(height: 330)
    }
}


struct CustomButton: View {
    var body: some View {
        Button {
            print("i was printed ...")
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(Color(red: 0.094, green: 0.408, blue: 0.992))
                
                Text("Next")
                    .foregroundColor(Color(red: 1, green: 1, blue: 1))
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
            }
            .frame(height: 60)
        }

    }
}




struct ChoiceGoalCustom: View {
    var title: String = ""
    var selected: Bool
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color(red: 252/255, green: 253/255, blue: 255/255))
            HStack {
                Text(title)
                    .foregroundColor(Color(red: 47/255, green: 47/255, blue: 51/255))
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                Spacer()
                Image(self.selected ? "Picker" : "no")
            }
            .padding([.leading, .trailing], 24)
        }
    }
}
