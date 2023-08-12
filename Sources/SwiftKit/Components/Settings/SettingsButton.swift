//
//  SettingsGroup.swift
//
//
//  Created by Nila on 12.08.2023.
//

import SwiftUI

public struct SettingsButton: View {
    public init(icon: String = "hand.tap", iconColor: Color = .accentColor, title: String = "Button", titleColor: Color = .primary, action: @escaping () -> Void = {}) {
        self.icon = icon
        self.iconColor = iconColor
        self.title = title
        self.titleColor = titleColor
        self.action = action
    }
    
    
    var icon: String = "hand.tap"
    var iconColor: Color = .accentColor
    var title: String = "Button"
    var titleColor: Color = .primary
    
    var action: () -> Void = {}
    
    public var body: some View {
        VStack(alignment: .leading) {
            VStack {
                HStack(spacing: 8) {
                    Image(systemName: icon)
                        .font(.headline)
                        .foregroundColor(iconColor)
                        .frame(minWidth: 25, alignment: .leading)
                        .accessibility(hidden: true)
                    Text(LocalizedStringKey(title))
                        .font(.system(.body))
                    Spacer()
                }
            }.foregroundColor(titleColor)
        }.padding(.vertical, 10).onTapGesture(perform: action)
    }
}

struct SettingsButton_Previews: PreviewProvider {
    static var previews: some View {
            VStack {
                Spacer()
                Text("Fantastic Buttons").font(.title).fontWeight(.medium)
                Text("And how you can code them").font(.subheadline).fontWeight(.regular).padding(.bottom)
                SettingsGroup {
                    SettingsButton(title: "The Magic Button")
                }.padding(.horizontal)
                SettingsGroup(name: "Elementary") {
                    SettingsButton(icon: "bolt.fill", iconColor: .secondary, title: "Electrical Outlet", titleColor: .secondary)
                    SettingsButton(icon: "leaf.fill", iconColor: .green, title: "Lawn Mower", titleColor: .green)
                    SettingsButton(icon: "drop.fill", iconColor: .blue, title: "Garden Hose", titleColor: .blue)
                    SettingsButton(icon: "flame.fill", iconColor: .red, title: "Fire Extinguisher", titleColor: .red)
                }.padding(.horizontal)
                Spacer()
            }
    }
}
