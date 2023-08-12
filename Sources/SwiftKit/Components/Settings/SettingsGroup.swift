//
//  SettingsGroup.swift
//  
//
//  Created by Nila on 12.08.2023.
//

import SwiftUI

public struct SettingsGroup<Content: View>: View {
    
    /// Name of the group to display above it
    var name: String?
    
    /// Color of the name text
    var nameColor: Color
    
    /// Content inside the settings group
    @ViewBuilder var content: Content
    
    public init(name: String?, nameColor: Color = Color.gray, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.name = name
        self.nameColor = nameColor
    }
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
        self.nameColor = Color.gray
    }
    
    public var body: some View {
        VStack {
            if name != nil {
                HStack {
                    Text(LocalizedStringKey(name!)).textCase(.uppercase).font(.subheadline).padding(.leading).foregroundColor(nameColor)
                    Spacer()
                }.padding(.top).padding(.bottom, -1)
            }
            VStack {
                content
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(15)
            .padding(.bottom, 6)
        }
    }
}

struct SettingsGroup_Previews: PreviewProvider {
    static var previews: some View {
            VStack {
                HStack {
                    Text("Settings").font(.title).fontWeight(.medium)
                    Spacer()
                }
                SettingsGroup {
                    SettingsLink(icon: "person", title: "My Account", link: "https://google.com")
                    SettingsLink(icon: "externaldrive.badge.icloud", title: "Manage Storage", link: "https://google.com")
                    SettingsButton(icon: "xmark.square", iconColor: .red, title: "Logout", titleColor: .red)
                }
                SettingsGroup(name: "Buttons and Toggles") {
                    SettingsButton()
                    SettingsLink(title: "This is a link", link: "https://google.com")
                    SettingsToggle()
                }
                SettingsGroup(name: "Pickers and Sliders") {
                    SettingsSegmentedPicker(title: "This is a segmented picker", segmentState: "Test", options: ["Test", "Test2"])
                    SettingsPicker(title: "This is a regular picker", segmentState: "Test", options: ["Test", "Test2"])
                    SettingsSlider(sliderState: 2, step: 1, bounds: 1...3)
                }
            }.padding().background(FluentBackground.Gray.ignoresSafeArea()).preferredColorScheme(.dark)
    }
}
