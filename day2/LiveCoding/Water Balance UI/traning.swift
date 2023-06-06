//
//  traning.swift
//  Water Balance UI
//
//  Created by Vasiliy Shannikov on 12.12.2021.
//

import SwiftUI

struct traning: View {
    
    var body: some View {
        ZStack{
            pyth
                
               
//            Circle()
//                .fill(.red)
//                .frame(width: 100, height: 200, alignment: .center)
        }
        
        
    }
    var pyth: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 350))
            path.addQuadCurve(to: CGPoint(x: 98, y: 345), control: CGPoint (x: 110, y: 355))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
        }
        .fill(.blue)
    }
}

struct traning_Previews: PreviewProvider {
    static var previews: some View {
        traning()
    }
}
