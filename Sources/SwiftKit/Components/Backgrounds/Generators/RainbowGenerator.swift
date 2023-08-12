//
//  RainbowGenerator.swift
//  
//
//  Created by Nila on 12.08.2023.
//

import SwiftUI

public struct RainbowGenerator: View {
    @State private var rotation: Double = 0
    
    let blur: CGFloat
    
    public init(_ blur: CGFloat = 60) {
        self.blur = blur
    }
    
    public var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color(red: 0.3, green: 0.3, blue: 0.3)
                VStack(alignment: .center) {
                    Rectangle()
                        .fill(AngularGradient(gradient: .init(colors: [.red, .orange, .green, .blue, .purple, .red]), center: .center, angle: .degrees(rotation)))
                        .animation(.linear(duration: 15).repeatForever(autoreverses: false), value: rotation)
                        .onAppear {
                            rotation = 360
                        }
                }.blur(radius: blur)
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    RainbowGenerator()
}
