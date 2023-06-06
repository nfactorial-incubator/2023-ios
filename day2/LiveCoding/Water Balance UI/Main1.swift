//
//  Main1.swift
//  Water Balance UI
//
//  Created by Vasiliy Shannikov on 11.12.2021.
//

import SwiftUI

struct Main1: View {
    let headerColor:Color = Color(red: 5.0 / 255, green: 165.0 / 255, blue:239.0 / 255, opacity: 1.0)
    let gradientStart = Color(red: 212.0 / 255, green: 225.0 / 255, blue:248.0 / 255, opacity: 1.0)

    let gradientEnd = Color(red: 212.0 / 255, green: 225.0 / 255, blue:248.0 / 255, opacity: 0.0)
    var waterAmount = 0.7 // that is value that you've already drunk.Try to change it, you'll see the changes jn the screen :)
    let fullVal = 2.4 // that is value you have to drink
    var header: String = ""
    var body: some View {
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
                                .frame(width: 160, height: 160)
                            VStack{
                                Text(" \((calculatePercenttage(val: waterAmount, fullVal: fullVal)),specifier: "%.f") %")
                                    .font(.system(size: 36,weight: .bold))
                                Text( String(waterAmount) + " out of " + String(fullVal) + "L" )
                            }
                        }
                        .padding(.bottom, 68)
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
            NextButton(title: "Add")
                //.padding(.bottom,50)
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
struct Main1_Previews: PreviewProvider {
    static var previews: some View {
        Main1()
    }
}
