//
//  FontPicker+Coordinator.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 9/29/19.

import UIKit

extension FontPicker {
    public class Coordinator: NSObject, UIFontPickerViewControllerDelegate {
        var onCancel: (() -> Void)?
        var didPickFont: (UIFontDescriptor) -> ()
        
        init(onCancel: (() -> Void)?, didPickFont: @escaping (UIFontDescriptor) -> ()) {
            self.onCancel = onCancel
            self.didPickFont = didPickFont
        }
        
        public func fontPickerViewControllerDidCancel(_ viewController: UIFontPickerViewController) {
            onCancel?()
            viewController.navigationController?.presentingViewController?.dismiss(animated: true, completion: onCancel)
        }
        
        public func fontPickerViewControllerDidPickFont(_ viewController: UIFontPickerViewController) {
            viewController.navigationController?.presentingViewController?.dismiss(animated: true) { [weak self] in
                self?.didPickFont(viewController.selectedFontDescriptor!)
            }
        }
    }
}
