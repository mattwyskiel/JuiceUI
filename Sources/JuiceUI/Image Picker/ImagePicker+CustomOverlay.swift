//
//  ImagePicker+CustomOverlay.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 9/29/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import SwiftUI
import CoreServices


/// An image picker that supports a custom overlay
public struct CustomOverlayImagePicker<OverlayView: View>: UIViewControllerRepresentable {
    
    public func makeCoordinator() -> ImagePicker.Coordinator {
        Coordinator(onCancel: onCancel, didReceiveInfo: didReceiveInfo)
    }
    
    var sourceType: ImagePicker.SourceType
    var overlayView: OverlayView? = nil
    var didReceiveInfo: (([UIImagePickerController.InfoKey: Any]) -> ())
    var onCancel: (() -> Void)? = nil
    var mediaTypes: [String] = [kUTTypeImage as String]
    
    public typealias Coordinator = ImagePicker.Coordinator
    
    public func makeUIViewController(context: Context) -> UIImagePickerController {
        let controller = UIImagePickerController()
        controller.sourceType = sourceType.UIKitRepresentation
        controller.mediaTypes = mediaTypes
        controller.delegate = context.coordinator
        return controller
    }
    
    public func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        if let view = overlayView {
            uiViewController.cameraOverlayView = UIHostingController(rootView: view).view
        }
    }
    
}
