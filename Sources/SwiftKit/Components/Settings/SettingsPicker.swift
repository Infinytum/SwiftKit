//
//  SettingsGroup.swift
//
//
//  Created by Nila on 12.08.2023.
//

import SwiftUI

public struct SettingsPicker: View {
    public init(icon: String = "eyedropper", iconColor: Color = .accentColor, title: String = "Picker", titleColor: Color = .primary, segmentState: String, options: [String] = [], readonly: Bool = false, action: @escaping ((String) -> ()) = {_ in }) {
        self.icon = icon
        self.iconColor = iconColor
        self.title = title
        self.titleColor = titleColor
        self.segmentState = segmentState
        self.options = options
        self.readonly = readonly
        self.action = action
    }
    
    var icon: String = "eyedropper"
    var iconColor: Color = .accentColor
    var title: String = "Picker"
    var titleColor: Color = .primary
    
    @State var segmentState: String {
        didSet {
            self.action(self.segmentState)
        }
    }
    var options: [String] = []
    var readonly: Bool = false
    
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
                    Spacer()
                    if readonly {
                        Text(segmentState).font(.system(.body))
                    } else {
                        Picker(segmentState, selection:  Binding(
                            get: { self.segmentState },
                            set: { self.segmentState = $0 }
                        )) {
                            ForEach(self.options, id: \.self) { option in
                                Text(option)
                            }
                        }.pickerStyle(MenuPickerStyle()).font(.system(.body)).foregroundColor(iconColor)
                            .padding(.trailing, -15)
                    }
                }
            }.foregroundColor(titleColor)
        }
        .padding(.vertical, 10)
    }
}

struct PickerSetting_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SettingsGroup {
                SettingsPicker(icon: "speedometer", title: "Pick one", segmentState: "One", options: ["One", "Two", "Three"])
                SettingsPicker(icon: "speedometer", title: "Pick one", segmentState: "One", options: ["One", "Two", "Three"], readonly: true)
            }
        }.padding()
    }
}
