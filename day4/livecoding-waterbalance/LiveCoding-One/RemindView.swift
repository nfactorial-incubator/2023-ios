//
//  RemindView.swift
//  LiveCoding-One
//
//  Created by ablai erzhanov on 07.06.2023.
//

import SwiftUI

enum Reminders: Codable {
    case quarterHour
    case halfHour
    case threeQuarterHour
    case hour
    case oneAndHalfHour
    case twoHours
    case threeHours
    case fourHours
    case none
}

struct RemindView: View {
    @State var activeReminder: Reminders = .none
    var body: some View {
            VStack {
                Text("WATER BALANCE")
                    .foregroundColor(Color(red: 0.02, green: 0.647, blue: 0.937))
                    .italic()
                    .font(.system(size: 24))
                    .fontWeight(.black)
                    .padding(.top, 68)
                
                Text("Remind me each")
                    .foregroundColor(Color(red: 0.185, green: 0.183, blue: 0.201))
                    .font(.system(size: 36))
                    .fontWeight(.semibold)
                    .padding(.top, 62)
                
                
                RemindersView(activeReminder: $activeReminder)
                    .padding(.top, 32)
                
                Spacer()
                
                ReminderViewButton(activeReminder: $activeReminder)
                    .padding(.bottom, 40)
            }
            .edgesIgnoringSafeArea(.all)
            .padding([.leading, .trailing], 16)
            .background(Color(red: 0.988, green: 0.992, blue: 1))
    }
}

struct RemindView_Previews: PreviewProvider {
    static var previews: some View {
        RemindView()
    }
}



struct RemindersView: View {
    @Binding var activeReminder: Reminders
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color(red: 0.833, green: 0.882, blue: 0.972))
            
            VStack(alignment: .center, spacing: 14) {
                HStack {
                    ChoiceRemindCustomView(title: "15 m", activeReminder: $activeReminder, reminderType: .quarterHour)
                    ChoiceRemindCustomView(title: "30 m", activeReminder: $activeReminder, reminderType: .halfHour)
                }
                
                HStack {
                    ChoiceRemindCustomView(title: "45 m", activeReminder: $activeReminder, reminderType: .threeQuarterHour)
                    ChoiceRemindCustomView(title: "1 hour", activeReminder: $activeReminder, reminderType: .hour)
                }
                
                HStack {
                    ChoiceRemindCustomView(title: "1.5 hour", activeReminder: $activeReminder, reminderType: .oneAndHalfHour)
                    ChoiceRemindCustomView(title: "2 hour", activeReminder: $activeReminder, reminderType: .twoHours)
                }
                
                HStack {
                    ChoiceRemindCustomView(title: "3 hour", activeReminder: $activeReminder, reminderType: .threeHours)
                    ChoiceRemindCustomView(title: "4 hour", activeReminder: $activeReminder, reminderType: .fourHours)
                }
                
            }
            .padding(.horizontal, 19)
            .padding([.top, .bottom], 24)
        }
        .frame(height: 330)
    }
}


struct ReminderViewButton: View {
    @Binding var activeReminder: Reminders
    var body: some View {
        Button {
            AppDataAPI.reminder = activeReminder
        } label: {
            NavigationLink(value: 2, label: {
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
            .disabled(activeReminder == .none)
        }

    }
}




struct ChoiceRemindCustomView: View {
    var title: String = ""
    @Binding var activeReminder: Reminders
    var reminderType: Reminders
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color(red: 252/255, green: 253/255, blue: 255/255))
                Text(title)
                    .foregroundColor(Color(red: 47/255, green: 47/255, blue: 51/255))
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
        }
        .overlay(activeReminder == reminderType ?  RoundedRectangle(cornerRadius: 16)
            .stroke(.blue, lineWidth: 4) : nil)
        .onTapGesture {
            if activeReminder == reminderType {
                activeReminder = .none
            } else {
                activeReminder = reminderType
            }
        }
    }
}
