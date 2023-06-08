//
//  SettingsGoalView.swift
//  LiveCoding-One
//
//  Created by ablai erzhanov on 08.06.2023.
//


import SwiftUI


struct SettingsGoalView: View {
    @EnvironmentObject var onboardManager: OnboardManager
    @State var activeGoal: Goals = .none
    var body: some View {
        VStack {
            Text("WATER BALANCE")
                .foregroundColor(Color(red: 0.02, green: 0.647, blue: 0.937))
                .italic()
                .font(.system(size: 24))
                .fontWeight(.black)
                .padding(.top, 68)
            
            Text("What is your goal?")
                .foregroundColor(Color(red: 0.185, green: 0.183, blue: 0.201))
                .font(.system(size: 36))
                .fontWeight(.semibold)
                .padding(.top, 62)
            
            
            GoalsView(activeGoal: $activeGoal)
                .padding(.top, 32)
            
            Spacer()
            
            
            SettingsGoalButton(activeGoal: $activeGoal)
                .padding(.bottom, 40)
        }
        .edgesIgnoringSafeArea(.all)
        .padding([.leading, .trailing], 16)
        .background(Color(red: 0.988, green: 0.992, blue: 1))
        
        .navigationDestination(for: Int.self) { value in
            if value == 1 {
                RemindView()
            }
            if value == 2 {
                DailyIntakeView()
                    .environmentObject(onboardManager)
            }
        }
    }
}

struct SettingsGoalView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsGoalView()
    }
}



struct SettingsGoalButton: View {
    @Binding var activeGoal: Goals
    var body: some View {
        Button {
            print("i was printed ...")
        } label: {
            NavigationLink(value: 1, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color(red: 0.094, green: 0.408, blue: 0.992))
                    
                    Text("Save")
                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                        .font(.system(size: 22))
                        .fontWeight(.semibold)
                }
                .frame(height: 60)
            })
            .disabled(activeGoal == .none)
        }
    }
}




