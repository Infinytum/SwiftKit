//
//  SettingsGroup.swift
//
//
//  Created by Nila on 12.08.2023.
//

import SwiftUI

public struct SettingsSegmentedPicker: View {
    public init(icon: String = "ruler", iconColor: Color = .accentColor, title: String = "Segmented Picker", titleColor: Color = .primary, segmentState: String, options: [String] = [], action: @escaping ((String) -> ()) = {_ in }) {
        self.icon = icon
        self.iconColor = iconColor
        self.title = title
        self.titleColor = titleColor
        self.segmentState = segmentState
        self.options = options
        self.action = action
    }
    
    var icon: String = "ruler"
    var iconColor: Color = .accentColor
    var title: String = "Segmented Picker"
    var titleColor: Color = .primary
    
    @State var segmentState: String {
        didSet {
            self.action(self.segmentState)
        }
    }
    var options: [String] = []
    
    // Last so we can use the view body for it
    var action: ((_ selected: String)->()) = {_ in }
    
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
                }
            }
                .foregroundColor(titleColor)
            VStack {
                Picker("", selection: Binding(
                    get: { self.segmentState },
                    set: { self.segmentState = $0 }
                )) {
                    ForEach(self.options, id: \.self) { option in
                        Text(option)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
        }
        .padding(.vertical, 10)
    }
}

struct SegmentedPickerSetting_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SettingsGroup {
                SettingsSegmentedPicker(icon: "speedometer", title: "Pick one", segmentState: "One", options: ["One", "Two", "Three"])
            }
        }.padding()
    }
}
