//
//  SheetHeader.swift
//  
//
//  Created by Nila on 12.08.2023.
//

import SwiftUI

struct SheetHeader: View {
    @Environment(\.presentationMode) var presentationMode
    
    var title: String
    var primary: String? = "Done"
    var secondary: String?
    var dismiss: (DismissalReason) -> Bool = {_ in return true}
    
    init(_ title: String) {
        self.title = title
    }
    
    init(_ title: String, primary: String?) {
        self.title = title
        self.primary = primary
    }
    
    init(_ title: String, primary: String?, dismiss: @escaping (DismissalReason) -> Bool) {
        self.title = title
        self.primary = primary
        self.dismiss = dismiss
    }
    
    init(_ title: String, secondary: String, dismiss: @escaping (DismissalReason) -> Bool) {
        self.title = title
        self.secondary = secondary
        self.dismiss = dismiss
    }
    
    init(_ title: String, primary: String?, secondary: String, dismiss: @escaping (DismissalReason) -> Bool) {
        self.title = title
        self.primary = primary
        self.secondary = secondary
        self.dismiss = dismiss
    }
    
    init(_ title: String, primary: String?, secondary: String) {
        self.title = title
        self.primary = primary
        self.secondary = secondary
    }
    
    var body: some View {
        ZStack {
            HStack(alignment: .center) {
                Spacer()
                Text(LocalizedStringKey(title)).font(.title3).fontWeight(.medium)
                Spacer()
            }
            if primary != nil {
                HStack(alignment: .center) {
                    Spacer()
                    Button(LocalizedStringKey(primary!), action: {
                        if dismiss(DismissalReason.Primary) {
                            presentationMode.wrappedValue.dismiss()
                        }
                    })
                }
            }
            if secondary != nil {
                HStack(alignment: .center) {
                    Button(LocalizedStringKey(secondary!), action: {
                        if dismiss(DismissalReason.Secondary) {
                            presentationMode.wrappedValue.dismiss()
                        }
                    })
                    Spacer()
                }
            }
        }.padding(.top).padding(.horizontal).padding(.bottom, 5)
    }
    
    enum DismissalReason: Int {
        case Primary = 0
        case Secondary = 1
    }
}


struct SheetHeader_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Spacer()
        }.frame(maxWidth: .infinity).sheet(isPresented: .constant(true)) {
            VStack {
                SheetHeader("Sheet Title", primary: "Confirm", secondary: "Cancel") { reason in
                    print("Cancelled")
                    return true
                }
                Spacer()
                Text("Feel free to put your").font(.title).fontWeight(.medium)
                Text("Sheet in here").fontWeight(.light).font(.system(size: 45))
                Spacer()
            }
        }.background(FluentBackground.Rainbow.material(.ultraThin).ignoresSafeArea())
    }
}
