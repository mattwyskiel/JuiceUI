//
//  ImagePicker+UIKitRepresentable.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 9/29/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import SwiftUI

extension ImagePicker: UIViewControllerRepresentable {
    public func makeCoordinator() -> ImagePicker.Coordinator {
        Coordinator(onCancel: onCancel, didReceiveInfo: didReceiveInfo)
    }
    
    public func makeUIViewController(context: Context) -> UIImagePickerController {
        let controller = UIImagePickerController()
        controller.sourceType = sourceType.UIKitRepresentation
        controller.mediaTypes = mediaTypes
        controller.delegate = context.coordinator
        return controller
    }
    
    public func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        context.coordinator.onCancel = onCancel
    }
}
