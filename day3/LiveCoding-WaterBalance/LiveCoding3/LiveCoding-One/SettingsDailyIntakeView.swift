//
//  SettingsDailyIntakeView.swift
//  LiveCoding-One
//
//  Created by ablai erzhanov on 08.06.2023.
//

import SwiftUI


struct SettingsDailyIntakeView: View {
    
    @EnvironmentObject var onboardManager: OnboardManager
    @State var isTextFieldActive: Bool = false
    @State var inputText: String = ""
    
    var body: some View {
        VStack {
            Text("WATER BALANCE")
                .foregroundColor(Color(red: 0.02, green: 0.647, blue: 0.937))
                .italic()
                .font(.system(size: 24))
                .fontWeight(.black)
                .padding(.top, 68)
            
            Text("Daily Intake?")
                .foregroundColor(Color(red: 0.185, green: 0.183, blue: 0.201))
                .font(.system(size: 36))
                .fontWeight(.semibold)
                .padding(.top, 62)
            
            
            SettingsDailyIntakeInputView(inputText: $inputText, isTextFieldActive: $isTextFieldActive)
                .padding(.top, 32)
            
            
            Spacer()
            
            SettingsDailyIntakeButton(onboardManager: onboardManager)
                .padding(.bottom, isTextFieldActive == false ? 40 : 180)
        }
        .edgesIgnoringSafeArea(.all)
        .padding([.leading, .trailing], 16)
        .background(Color(red: 0.988, green: 0.992, blue: 1))
    }
}

struct SettingsDailyIntakeInputView: View {
    @Binding var inputText: String
    @Binding var isTextFieldActive: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color(red: 0.833, green: 0.882, blue: 0.972))
            
            HStack(alignment: .center) {
                TextField("Enter amount here...", text: $inputText, onEditingChanged: { editingChanged in
                    if editingChanged {
                        isTextFieldActive = true
                    } else {
                        isTextFieldActive = false
                    }
                })
                    .foregroundColor(.blue)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.center)
                    .padding(.trailing, 12)
                Text("ML")
                    .foregroundColor(Color(red: 0.184, green: 0.184, blue: 0.2))
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .padding(.trailing, 19)
            }
            .padding(.horizontal, 19)
        }
        .frame(height: 108)

    }
}

struct SettingsDailyIntakeView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsDailyIntakeView()
    }
}




struct SettingsDailyIntakeButton: View {
    var onboardManager: OnboardManager
    var body: some View {
        Button {
            AppDataAPI.isOnboarding = false
            onboardManager.isOnboarding = false
        } label: {
//            NavigationLink(value: 3, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color(red: 0.094, green: 0.408, blue: 0.992))
                    
                    Text("Add")
                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                        .font(.system(size: 22))
                        .fontWeight(.semibold)
                }
                .frame(height: 60)
//            })
        }

    }
}



