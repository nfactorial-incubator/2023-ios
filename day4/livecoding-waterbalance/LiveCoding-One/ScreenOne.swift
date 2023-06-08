//
//  ScreenOne.swift
//  LiveCoding-One
//
//  Created by ablai erzhanov on 05.06.2023.
//


import SwiftUI

enum Goals: Codable {
    case goalOne
    case goalTwo
    case goalThree
    case goalFour
    case none
}

struct ScreenOne: View {
    @EnvironmentObject var onboardManager: OnboardManager
    @State var activeGoal: Goals = .none
    var body: some View {
        NavigationStack {
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
                

                CustomButton(activeGoal: $activeGoal)
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
}

struct ScreenOne_Previews: PreviewProvider {
    static var previews: some View {
        ScreenOne()
    }
}



struct GoalsView: View {
    @Binding var activeGoal: Goals
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color(red: 0.833, green: 0.882, blue: 0.972))
            
            VStack(alignment: .center, spacing: 14) {
                ChoiceGoalCustom(title: "Goal Number One", activeGoal: $activeGoal, typeOfGoal: .goalOne)
                ChoiceGoalCustom(title: "Goal Number Two", activeGoal: $activeGoal, typeOfGoal: .goalTwo)
                ChoiceGoalCustom(title: "Goal Number Three", activeGoal: $activeGoal, typeOfGoal: .goalThree)
                ChoiceGoalCustom(title: "Goal Number Four", activeGoal: $activeGoal, typeOfGoal: .goalFour)
                
            }
            .padding(.horizontal, 19)
            .padding([.top, .bottom], 24)
        }
        .frame(height: 330)
    }
}


struct CustomButton: View {
    @Binding var activeGoal: Goals
    var body: some View {
        Button {
            AppDataAPI.userGoal = activeGoal
        } label: {
            NavigationLink(value: 1, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color(red: 0.094, green: 0.408, blue: 0.992))
                    
                    Text("Next")
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




struct ChoiceGoalCustom: View {
    var title: String = ""
    @Binding var activeGoal: Goals
    var typeOfGoal: Goals
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
                if typeOfGoal ==  activeGoal {
                    Image("Picker")
                } else {
                    Image("no")
                }
            }
            .padding([.leading, .trailing], 24)
        }
        .onTapGesture {
            if typeOfGoal == activeGoal {
                activeGoal = .none
            } else {
                activeGoal = typeOfGoal
            }
        }
    }
}
