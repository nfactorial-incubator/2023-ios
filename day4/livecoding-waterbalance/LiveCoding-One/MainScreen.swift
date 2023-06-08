//
//  MainScreen.swift
//  nFactorial-LiveCoding-One
//
//  Created by ablai erzhanov on 05.06.2023.
//

import SwiftUI

struct MainScreen: View {
    let headerColor:Color = Color(red: 5.0 / 255, green: 165.0 / 255, blue:239.0 / 255, opacity: 1.0)
    let gradientStart = Color(red: 212.0 / 255, green: 225.0 / 255, blue:248.0 / 255, opacity: 1.0)

    let gradientEnd = Color(red: 212.0 / 255, green: 225.0 / 255, blue:248.0 / 255, opacity: 0.0)
    @State var waterAmount = 0.0 // that is value that you've already drunk.Try to change it, you'll see the changes jn the screen :)
    let fullVal = AppDataAPI.intakeAmount // that is value you have to drink
    var header: String = ""
    @State var scale = 1.0
    var body: some View {
        NavigationStack {
            VStack {
                Text("WATER BALANCE")
                    .font(.system(size: 24, weight: .black))
                    .italic()
                    .foregroundColor(headerColor)
                    .padding(.bottom, 32)
                ZStack {
                    Rectangle()
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [gradientStart, gradientEnd]),
                                           startPoint: .top,
                                           endPoint: .bottom))
                    VStack {
                        ZStack {
                            Group{
                                Circle()
                                    .stroke(.white, lineWidth: 10)
                                    .frame(width: 180, height: 180, alignment: .center)
                                Circle()
                                    .trim(from: 0, to: CGFloat(calculatePercenttage(val: waterAmount, fullVal: fullVal)/100.0))
                                    .fill(.blue)
                                    .rotationEffect(.degrees(Double(90 - offsetVal(percent: calculatePercenttage(val: waterAmount, fullVal: fullVal)))))
                                    .frame(width: 160, height: 160, alignment: .center)
                                    
                                    
                                VStack{
                                    Text(" \((calculatePercenttage(val: waterAmount, fullVal: fullVal)),specifier: "%.f") %")
                                        .font(.system(size: 36,weight: .bold))
                                    Text( String(waterAmount) + " out of " + String(fullVal) + "L" )
                                }
                            }
                            .padding(.bottom, 68)
                            .animation(.easeOut(duration: 1.5), value: waterAmount)
                        }
                        Text("Monday, 25th of November")
                            .font(.system(size: 17))
                            .foregroundColor(.black)
                            .padding(.bottom, 32)
                    }
                }
                .frame(width: 358, height: 332)
                
                Text(sign(perc: calculatePercenttage(val: waterAmount, fullVal: fullVal)))
                    .font(.system(size: 36, weight: .semibold, design: .rounded))
                    .multilineTextAlignment(.center)
                    .frame(width: 358, height: 92, alignment: .center)
                Spacer()
                MainScreenButton()
                    .padding(.bottom,50)
                    .onTapGesture {
                        scale = 3
                    }
            }
            .padding(.horizontal, 16)
            .navigationDestination(for: Int.self) { value in
                    DailyIntakeView()
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    waterAmount = 700
                }
            }
        }
    }
    
    func sign(perc: Double) -> String {
        if perc > 0 {
            return   "Great job!"}
        else {
            return     "Add your fist drink for today"
        }
    }

    func offsetVal(percent:Double) -> Double {
        let res: Double  = percent * 1.8
        return res
    }

    func trim(percent :Int) -> CGFloat {
        let res: CGFloat = CGFloat(percent / 100)
        return res
    }

    func calculatePercenttage(val:Double, fullVal: Double) -> Double {
        val * 100.0 / fullVal
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}


struct MainScreenButton: View {
    var body: some View {
        Button {
            print("i was printed ...")
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
        }

    }
}
