//
//  SettingsGroup.swift
//
//
//  Created by Nila on 12.08.2023.
//

import SwiftUI

public struct SettingsToggle: View {
    public init(icon: String = "switch.2", iconColor: Color = .accentColor, title: String = "Toggle", titleColor: Color = .primary, toggleState: Bool = false, action: @escaping ((Bool) -> ()) = {_ in }) {
        self.icon = icon
        self.iconColor = iconColor
        self.title = title
        self.titleColor = titleColor
        self.toggleState = toggleState
        self.action = action
    }
    
    
    var icon: String = "switch.2"
    var iconColor: Color = .accentColor
    var title: String = "Toggle"
    var titleColor: Color = .primary
    
    @State var toggleState: Bool {
        didSet {
            self.action(self.toggleState)
        }
    }
    
    // Last so we can use the view body for it
    var action: ((_ toggleState: Bool)->()) = {_ in }
    
    public var body: some View {
        VStack(alignment: .leading) {
            VStack {
                HStack(spacing: 8) {
                    Image(systemName: icon)
                        .font(.headline)
                        .foregroundColor(iconColor)
                        .frame(minWidth: 25, alignment: .leading)
                        .accessibility(hidden: true)
                    Toggle(LocalizedStringKey(title), isOn: Binding(
                        get: { self.toggleState },
                        set: { self.toggleState = $0 }
                    )).frame(height: 20, alignment: .leading)
                }
            }.foregroundColor(titleColor)
        }.padding(.vertical, 10)
    }
}

struct SettingsToggle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SettingsGroup {
                SettingsToggle()
            }
        }.padding()
    }
}
