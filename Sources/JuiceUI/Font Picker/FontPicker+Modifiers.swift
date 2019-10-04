//
//  FontPicker+Modifiers.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 9/29/19.

import Foundation

extension FontPicker {
    
    /// Enables the caller to know when a user has canceled their interaction with the font selection screen.
    /// - Parameter handler: The function that is called if a user cancels the font selection screen
    public func onCancel(_ handler: @escaping () -> ()) -> Self {
        FontPicker(configuration: configuration, didPickFont: didPickFont, onCancel: handler)
    }
}
