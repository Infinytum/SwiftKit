//
//  Date.swift
//  
//
//  Created by Nila on 12.08.2023.
//

import Foundation

public extension Date {
    /// Returns a relative date string from the given date to now in the device timezone.
    /// Example: "2 hours ago"
    func relative(format: RelativeDateTimeFormatter.UnitsStyle = .full, to: Date = Date()) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = format
        return formatter.localizedString(for: self, relativeTo: to)
    }
}
