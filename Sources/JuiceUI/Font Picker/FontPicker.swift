//
//  FontPicker.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 8/6/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import SwiftUI

public struct FontPicker {
    
    var configuration: UIFontPickerViewController.Configuration
    var didPickFont: (UIFontDescriptor) -> ()
    var onCancel: (() -> Void)?
    
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
