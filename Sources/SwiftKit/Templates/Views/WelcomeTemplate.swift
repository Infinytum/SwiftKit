//
//  WelcomeTemplate.swift
//  
//
//  Created by Nila on 12.08.2023.
//

import SwiftUI

public struct WelcomeTemplate<Content: View>: View {
    @Environment(\.colorScheme) var colorScheme
    
    var appName: String
    var slogan: String = "An Infinytum Project"
    var image: AnyView = AnyView(InfinytumLogo())
    @ViewBuilder var content: Content
    
    public init(appName: String, slogan: String = "An Infinytum Project", image: AnyView = AnyView(InfinytumLogo()), @ViewBuilder content: () -> Content) {
        self.appName = appName
        self.slogan = slogan
        self.image = image
        self.content = content()
    }
    
    public var body: some View {
        VStack {
            VStack {
                Spacer()
                image.frame(height: 60)
                Text("Welcome to").font(.title).fontWeight(.medium).padding(.top)
                Text(LocalizedStringKey(appName)).fontWeight(.light).font(.system(size: 45))
                if(slogan.count != 0) {
                    Text(LocalizedStringKey(slogan)).font(.system(size: 15)).fontWeight(.semibold).padding(.top, 1)
                } else {
                    InfinytumProject()
                }
                Spacer()
            }
            ZStack {
                Color(uiColor: UIColor.systemBackground).edgesIgnoringSafeArea(.all)
                VStack {
                    content
                }.padding()
            }
        }.background(colorScheme == .dark ? FluentBackground.Gray.ignoresSafeArea() : FluentBackground.Rainbow.ignoresSafeArea())
    }
}

struct WelcomeTemplate_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeTemplate(appName: "SwiftKit Demo", slogan: "A Demo Project", image: AnyView(Image(systemName: "plus.app").resizable().scaledToFit())) {
            Spacer()
            Group {
                Text("What is ").fontWeight(.medium) +
                Text(LocalizedStringKey("SwiftKit Demo")).fontWeight(.medium)
            }.font(.title2)
            Text("SwiftKit Demo lets you try out all the things SwiftKit has to offer without the need of creating a project yourself. Experience the components, animations and gestures yourself instead of looking at a picture or video online.")
                .font(.body).fontWeight(.regular).multilineTextAlignment(.center).padding(.top, 1).padding(.horizontal)
            Spacer()
            VStack {
                Button("Continue") {}
            }
        }
    }
}

