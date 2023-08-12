//
//  AnyTransition.swift
//  
//
//  Created by Nila on 12.08.2023.
//

import SwiftUI

public extension AnyTransition {
    /// A transition that inserts by moving in from the trailing edge, and
    /// removes by moving out towards the leading edge.
    ///
    /// - SeeAlso: `AnyTransition.move(edge:)`
    static var backslide: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading))}
}
