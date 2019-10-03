//
//  ImagePicker+Modifiers.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 9/29/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import SwiftUI

extension ImagePicker {
    
    /// Adds an overlay view to an image picker with a camera source type
    /// - Parameter overlayView: The view to overlay onto the camera view
    public func cameraOverlayView<OverlayView: View>(overlayView: @autoclosure () -> (OverlayView)) -> CustomOverlayImagePicker<OverlayView> {
        CustomOverlayImagePicker(sourceType: sourceType, overlayView: overlayView(), didReceiveInfo: didReceiveInfo, onCancel: onCancel, mediaTypes: mediaTypes)
    }
}

extension ImagePicker {
    
    /// Enables the caller to know when the user canceled the operatino in the image picker
    /// - Parameter handler: The function used to handler the cancel action
    public func onCancel(_ handler: @escaping () -> ()) -> Self {
        ImagePicker(sourceType: sourceType, didReceiveInfo: didReceiveInfo, onCancel: handler, mediaTypes: mediaTypes)
    }
}

extension CustomOverlayImagePicker {
    /// Enables the caller to know when the user canceled the operatino in the image picker
    /// - Parameter handler: The function used to handler the cancel action
    public func onCancel(_ handler: @escaping () -> ()) -> Self {
        CustomOverlayImagePicker(sourceType: sourceType, overlayView: overlayView, didReceiveInfo: didReceiveInfo, onCancel: handler, mediaTypes: mediaTypes)
    }
}
