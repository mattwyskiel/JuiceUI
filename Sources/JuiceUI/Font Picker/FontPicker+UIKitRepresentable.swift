//
//  FontPicker+UIKitRepresentable.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 9/29/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import SwiftUI

extension FontPicker: UIViewControllerRepresentable {
    public func makeCoordinator() -> FontPicker.Coordinator {
        Coordinator(onCancel: onCancel, didPickFont: didPickFont)
    }
    
    public func makeUIViewController(context: Context) -> UIFontPickerViewController {
        let controller = UIFontPickerViewController(configuration: configuration)
        controller.delegate = context.coordinator
        return controller
    }
    
    public func updateUIViewController(_ viewController: UIFontPickerViewController, context: Context) {
        
    }
}
