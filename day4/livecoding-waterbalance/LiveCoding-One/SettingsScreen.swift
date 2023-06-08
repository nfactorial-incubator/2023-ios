//
//  SettingsScreen.swift
//  nFactorial-LiveCoding-One
//
//  Created by ablai erzhanov on 05.06.2023.
//

import SwiftUI



struct SettingsScreen: View {
    
    enum Screens {
        case dailyIntakeView
        case goalView
        case reminderView
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 0) {
                Text("SETTINGS")
                    .foregroundColor(Color(red: 0.02, green: 0.647, blue: 0.937))
                    .italic()
                    .font(.system(size: 24))
                    .fontWeight(.black)
                    .padding(.top, 56)
                
                
                Spacer()
                
                List {
                    Section {
                        NavigationLink(value: Screens.dailyIntakeView) {
                            HStack{
                                Text("Daily Intake Level")
                                    .foregroundColor(.black)
                                Spacer()
                                Text("2400 ml")
                                    .foregroundColor(Color(red: 0.235, green: 0.235, blue: 0.263)).opacity(0.6)
                            }
                        }
                        
                        NavigationLink(value: Screens.goalView) {
                            HStack{
                                Text("Your Goal")
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }
                        
                        
                        NavigationLink(value: Screens.reminderView) {
                            HStack{
                                Text("Reminder")
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }
                        
                    }
                    
                }
                .listStyle(.inset)
            }
            .padding([.leading, .trailing], 16)
            .background(Color(red: 0.988, green: 0.992, blue: 1))
            .edgesIgnoringSafeArea(.all)
            .navigationDestination(for: Screens.self) { value in
                switch value {
                case .dailyIntakeView:
                    SettingsDailyIntakeView()
                case .goalView:
                    SettingsGoalView()
                case .reminderView:
                    SettingsReminderView()
                }
            }
        }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
