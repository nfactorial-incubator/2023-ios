//
//  SettingsReminderView.swift
//  LiveCoding-One
//
//  Created by ablai erzhanov on 08.06.2023.
//

import SwiftUI


struct SettingsReminderView: View {
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
                
                SettingsReminderViewButton(activeReminder: $activeReminder)
                    .padding(.bottom, 40)
            }
            .edgesIgnoringSafeArea(.all)
            .padding([.leading, .trailing], 16)
            .background(Color(red: 0.988, green: 0.992, blue: 1))
    }
}

struct SettingsReminderView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsReminderView()
    }
}

struct SettingsReminderViewButton: View {
    @Binding var activeReminder: Reminders
    var body: some View {
        Button {
            print("i was printed ...")
        } label: {
            NavigationLink(value: 2, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color(red: 0.094, green: 0.408, blue: 0.992))
                    
                    Text("Add")
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




