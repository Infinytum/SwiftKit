//
//  InfinytumProject.swift
//  
//
//  Created by Nila on 12.08.2023.
//

import SwiftUI

public struct InfinytumProject: View {
    public var body: some View {
        HStack {
            InfinytumLogo().frame(height: 30)
            Text("An Infinytum Project").font(.system(size: 15)).fontWeight(.semibold)
        }.onTapGesture {
            if let url = URL(string: "https://infinytum.co") {
                   UIApplication.shared.open(url)
            }
        }
    }
}

struct InfinytumProject_Previews: PreviewProvider {
    static var previews: some View {
        InfinytumProject()
    }
}
