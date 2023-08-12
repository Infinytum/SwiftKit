//
//  SettingsGroup.swift
//
//
//  Created by Nila on 12.08.2023.
//

import SwiftUI

public struct SettingsSlider: View {
    public init(icon: String = "slider.horizontal.3", iconColor: Color = .accentColor, title: String = "Slider", titleColor: Color = .primary, unit: String = "", sliderState: Double, step: Double, bounds: ClosedRange<Double>, action: @escaping ((Double) -> ()) = {_ in }) {
        self.icon = icon
        self.iconColor = iconColor
        self.title = title
        self.titleColor = titleColor
        self.unit = unit
        self.sliderState = sliderState
        self.step = step
        self.bounds = bounds
        self.action = action
    }
    
    var icon: String = "slider.horizontal.3"
    var iconColor: Color = .accentColor
    var title: String = "Slider"
    var titleColor: Color = .primary
    
    var unit: String = ""
    
    @State var sliderState: Double {
        didSet {
            self.action(self.sliderState)
        }
    }
    var step: Double
    var bounds: ClosedRange<Double>
    
    // Last so we can use the view body for it
    var action: ((_ selected: Double)->()) = {_ in }
    
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
                    Text(String(sliderState) + " " + unit)
                        .font(.system(.body))
                }
            }
                .foregroundColor(titleColor)
            VStack {
                Slider(
                    value: Binding(
                        get: { self.sliderState },
                        set: { self.sliderState = $0 }
                    ),
                    in: bounds,
                    step: step
                )
            }.padding(.top, 5)
        }
        .padding(.vertical, 10)
    }
}

struct SliderSetting_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SettingsGroup {
                SettingsSlider(icon: "speedometer", title: "Refresh Time", unit: "Hours", sliderState: 2, step: 0.5, bounds: 0.5...4)
            }
        }.padding()
    }
}
