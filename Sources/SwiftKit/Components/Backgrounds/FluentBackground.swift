//
//  FluentBackground.swift
//  
//
//  Created by Nila on 12.08.2023.
//

import SwiftUI

public struct FluentBackground: View {
    
    /// Built-in fluent aurora background
    public static let Aurora = FluentBackground(AnyView(AuroraGenerator(60)))
    
    /// Built-in fluent grayscale background
    public static let Gray = FluentBackground(AnyView(GrayscaleGenerator(40)))
    
    /// Built-in fluent rainbow background
    public static let Rainbow = FluentBackground(AnyView(RainbowGenerator(60)))
    
    /// The view that will be used as the background and rotated
    /// Usually this is an image, but you can put any view in here!
    private var background: AnyView
    
    /// The material thickness used for the fluent overlay
    private var material: Material? = .regularMaterial
    
    public init(_ background: AnyView, material: Material? = .regularMaterial) {
        self.background = background
        self.material = material
    }
    
    public init(_ background: Image, material: Material? = .regularMaterial) {
        self.background = AnyView(background)
        self.material = material
    }
    
    public var body: some View {
        ZStack() {
            Color.clear.background(background)
            if material != nil {
                Rectangle()
                    .fill(material!)
            }
        }
    }
}

extension FluentBackground {
    /// Change the material of the fluent background
    public func material(_ material: Material?) -> FluentBackground {
        var new = self
        new.material = material
        return new
    }
}

struct FluentBackground_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            Text("Fluent Backgrounds").font(.title).fontWeight(.medium)
            Text("Simply Elegant").fontWeight(.light).font(.system(size: 45))
            Spacer()
        }.frame(maxWidth: .infinity).background(FluentBackground.Aurora.material(.ultraThin).edgesIgnoringSafeArea(.all))
            .previewDisplayName("Aurora")
        VStack {
            Spacer()
            Text("Fluent Backgrounds").font(.title).fontWeight(.medium)
            Text("Simply Elegant").fontWeight(.light).font(.system(size: 45))
            Spacer()
        }.frame(maxWidth: .infinity).background(FluentBackground.Gray.material(.ultraThin).edgesIgnoringSafeArea(.all))
            .previewDisplayName("Grayscale")
        VStack {
            Spacer()
            Text("Fluent Backgrounds").font(.title).fontWeight(.medium)
            Text("Simply Elegant").fontWeight(.light).font(.system(size: 45))
            Spacer()
        }.frame(maxWidth: .infinity).background(FluentBackground.Rainbow.material(.ultraThin).edgesIgnoringSafeArea(.all))
            .previewDisplayName("Rainbow")
    }
}
