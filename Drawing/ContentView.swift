//
//  ContentView.swift
//  Drawing
//
//  Created by Prakhar Trivedi on 11/3/23.
//

import SwiftUI

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Draw the diagonal lines
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY / 2))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY / 2))
        
        // Draw central line branch
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        
//        path.closeSubpath()
        
        return path
    }
}

struct ContentView: View {
    @State var lineWidth: CGFloat = 10
    
    var body: some View {
        VStack {
            Spacer()
            Arrow()
                .stroke(.black, lineWidth: lineWidth)
                .frame(width: 300, height: 300)
            
            Spacer()
            
            Slider(value: $lineWidth, in: 1...50)
                .padding()
            
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
