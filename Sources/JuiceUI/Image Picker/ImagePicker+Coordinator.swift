//
//  ImagePicker+Coordinator.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 9/29/19.

import UIKit

extension ImagePicker {
    public class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var onCancel: (() -> Void)?
        var didReceiveInfo: (([UIImagePickerController.InfoKey: Any]) -> ())?
        
        init(onCancel: (() -> Void)?, didReceiveInfo: (([UIImagePickerController.InfoKey: Any]) -> ())?) {
            self.onCancel = onCancel
            self.didReceiveInfo = didReceiveInfo
        }
        
        public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            onCancel?()
            picker.presentingViewController?.dismiss(animated: true, completion: onCancel)
        }
        
        public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.presentingViewController?.dismiss(animated: true, completion: { [weak self] in self?.didReceiveInfo?(info) })
        }
    }
}
