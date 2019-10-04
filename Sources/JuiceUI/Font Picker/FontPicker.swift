//
//  FontPicker.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 8/6/19.

import SwiftUI

/// A SwiftUI View based on the UIFontPickerViewController in UIKit
public struct FontPicker {
    
    var configuration: UIFontPickerViewController.Configuration
    var didPickFont: (UIFontDescriptor) -> ()
    var onCancel: (() -> Void)?
    
    /// Initializes the Font Picker View
    /// - Parameter configuration: A configuration object - see UIFontPickerViewController.Configuration for details
    /// - Parameter didPickFont: A completion handler determining what to do with the selected font.
    public init(configuration: UIFontPickerViewController.Configuration = .init(), didPickFont: @escaping (UIFontDescriptor) -> ()) {
        self.configuration = configuration
        self.didPickFont = didPickFont
    }
    
    /* internal - do not use this from outside */
    init(configuration: UIFontPickerViewController.Configuration = .init(), didPickFont: @escaping (UIFontDescriptor) -> (), onCancel: (() -> ())?) {
        self.configuration = configuration
        self.didPickFont = didPickFont
        self.onCancel = onCancel
    }
}
