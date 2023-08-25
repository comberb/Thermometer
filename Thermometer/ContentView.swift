//
//  ContentView.swift
//  Thermometer
//
//  Created by Ben Comber on 25/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var progress: CGFloat = 0.5
    
    private let tubeFrame: CGSize = .init(width: 100, height: 500)
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            title
            ZStack(alignment: .center) {
                
                shadow
                tubeMask
                
                Thermometer(
                    progress: $progress,
                    strength: .constant(4),
                    frequency: .constant(8)
                )
                .frame(width: tubeFrame.width, height: tubeFrame.height)
                
                HStack {
                    Marker(progress: $progress)
                    Spacer()
                    VSlider(sliderProgress: $progress)
                }
            }
            .padding()
        }
    }
    
    var title: some View {
        HStack(spacing: 0) {
            Text(Int(progress * 30 + 20).description)
                .fontWeight(.bold)
                .foregroundColor(Color(UIColor(hex: "#BFC7D7")).opacity(0.6))
                .font(.system(size: 120))
            Text("°")
                .fontWeight(.regular)
                .foregroundColor(Color(UIColor(hex: "#BFC7D7")).opacity(0.6))
                .font(.system(size: 80))
                .offset(y: -30)
        }
    }
    
    var shadow: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(LinearGradient.rainbow)
            .frame(
                width: tubeFrame.width * 0.3,
                height: tubeFrame.height
            )
            .mask(RoundedRectangle(cornerRadius: tubeFrame.width * 0.5))
            .blur(radius: 20)
            .opacity(0.8)
            .offset(x: -50, y: 0)
    }
    
    var tubeMask: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(
                LinearGradient(gradient: Gradient(colors: [
                    Color(UIColor(hex: "#ECECEC")),
                    Color(UIColor(hex: "#FFFFFF")),
                ]), startPoint: .top, endPoint: .bottom)
            )
            .frame(width: tubeFrame.width, height: tubeFrame.height)
            .mask(RoundedRectangle(cornerRadius: tubeFrame.width * 0.5))
            .opacity(0.8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
