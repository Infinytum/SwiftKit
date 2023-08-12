//
//  GrayscaleGenerator.swift
//  
//
//  Created by Nila on 12.08.2023.
//

import SwiftUI

public struct GrayscaleGenerator: View {
    let blur: CGFloat
    
    public init(_ blur: CGFloat = 60) {
        self.blur = blur
    }
    
    public var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color(red: 0.3, green: 0.3, blue: 0.3)
                ZStack {
                    Cloud(proxy: proxy,
                          color: Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 0.7),
                          rotationStart: 0,
                          duration: 60,
                          alignment: Alignment.bottomTrailing)
                    Cloud(proxy: proxy,
                          color: Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 0.5),
                          rotationStart: 240,
                          duration: 50,
                          alignment: .topTrailing)
                    Cloud(proxy: proxy,
                          color: Color(red: 0.7, green: 0.7, blue: 0.7, opacity: 0.55),
                          rotationStart: 120,
                          duration: 80,
                          alignment: .bottomLeading)
                    Cloud(proxy: proxy,
                          color: Color(red: 0.4, green: 0.4, blue: 0.4, opacity: 0.81),
                          rotationStart: 180,
                          duration: 70,
                          alignment: .topLeading)
                }.blur(radius: blur)
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    GrayscaleGenerator()
}
