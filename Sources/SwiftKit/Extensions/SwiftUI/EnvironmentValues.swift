//
//  EnvironmentValues.swift
//  
//
//  Created by Nila on 12.08.2023.
//

import SwiftUI

public extension EnvironmentValues {
    
    /// Check whether the application is running inside Xcode Previews
    var isPreview: Bool {
        #if DEBUG
        return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
        #else
        return false
        #endif
    }
}
