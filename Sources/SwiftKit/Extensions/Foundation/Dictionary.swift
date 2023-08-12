//
//  Dictionary.swift
//  
//
//  Created by Nila on 12.08.2023.
//

import Foundation

public extension Dictionary where Value: Equatable {
    
    /// Find the key for a given value
    func someKey(forValue val: Value) -> Key? {
        return first(where: { $1 == val })?.key
    }
}
