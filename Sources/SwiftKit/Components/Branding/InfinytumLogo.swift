//
//  InfinytumLogo.swift
//  
//
//  Created by Nila on 12.08.2023.
//

import SwiftUI

public struct InfinytumLogo: View {
    var glow: Bool
    
    public init(glow: Bool = false) {
        self.glow = glow
    }
    
    @State private var rotation = 0.0
    public var body: some View {
        ZStack {
            if glow {
                RainbowGenerator(0).cornerRadius(.infinity).blur(radius: 20.0)
            }
            Image(packageResource: "InfinytumIcon", ofType: "jpg").resizable().scaledToFit().cornerRadius(.infinity)
        }.fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: false)
    }
}

struct InfinytumLogo_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            InfinytumLogo().frame(height: 100).shadow(radius: 5)
            Spacer()
            InfinytumLogo(glow: true).frame(height: 100)
            Spacer()
        }
    }
}
