//
//  AuroraGenerator.swift
//  
//
//  Created by Nila on 12.08.2023.
//

import SwiftUI

public struct AuroraGenerator: View {
    let blur: CGFloat
    
    public init(_ blur: CGFloat = 60) {
        self.blur = blur
    }
    
    public var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color(red: 0.043, green: 0.467, blue: 0.494)
                ZStack {
                    Cloud(proxy: proxy,
                          color: Color(red: 0.541, green: 0.733, blue: 0.812, opacity: 0.3),
                          rotationStart: 0,
                          duration: 50,
                          alignment: Alignment.bottomTrailing)
                    Cloud(proxy: proxy,
                          color: Color(red: 0.541, green: 0.733, blue: 0.812, opacity: 0.3),
                          rotationStart: 0,
                          duration: 100,
                          alignment: Alignment.bottomTrailing)
                    Cloud(proxy: proxy,
                          color: Color(red: 0.196, green: 0.796, blue: 0.329, opacity: 0.5),
                          rotationStart: 240,
                          duration: 40,
                          alignment: .topTrailing)
                    Cloud(proxy: proxy,
                          color: Color(red: 0.196, green: 0.796, blue: 0.329, opacity: 0.5),
                          rotationStart: 120,
                          duration: 40,
                          alignment: .topTrailing)
                    Cloud(proxy: proxy,
                          color: Color(red: 0.196, green: 0.749, blue: 0.486, opacity: 0.55),
                          rotationStart: 120,
                          duration: 70,
                          alignment: .bottomLeading)
                    Cloud(proxy: proxy,
                          color: Color(red: 0.196, green: 0.749, blue: 0.486, opacity: 0.55),
                          rotationStart: 240,
                          duration: 70,
                          alignment: .bottomLeading)
                    Cloud(proxy: proxy,
                          color: Color(red: 0.039, green: 0.388, blue: 0.502, opacity: 0.81),
                          rotationStart: 180,
                          duration: 60,
                          alignment: .topLeading)
                    Cloud(proxy: proxy,
                          color: Color(red: 0.039, green: 0.388, blue: 0.502, opacity: 0.81),
                          rotationStart:0,
                          duration: 60,
                          alignment: .topLeading)
                }.blur(radius: blur)
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    AuroraGenerator()
}
