//
//  SettingsGroup.swift
//
//
//  Created by Nila on 12.08.2023.
//

import SwiftUI

struct SettingsLink: View {
    
    var icon: String = "link"
    var iconColor: Color = .accentColor
    var title: String = "Link"
    var titleColor: Color = .primary
    
    var link: String
    
    var body: some View {
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
                    Image(systemName: "chevron.right")
                }
            }.foregroundColor(titleColor)
        }.padding(.vertical, 10).onTapGesture {
            if let url = URL(string: link) {
                   UIApplication.shared.open(url)
            }
        }
    }
}

struct SettingsLink_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SettingsGroup {
                SettingsLink(title: "Open Google", link: "https://google.com")
            }
        }.padding()
    }
}
