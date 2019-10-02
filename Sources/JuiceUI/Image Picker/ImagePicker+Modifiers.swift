//
//  ImagePicker+Modifiers.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 9/29/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import SwiftUI

extension ImagePicker {
    public func cameraOverlayView<OverlayView: View>(overlayView: @autoclosure () -> (OverlayView)) -> CustomOverlayImagePicker<OverlayView> {
        CustomOverlayImagePicker(sourceType: sourceType, overlayView: overlayView(), didReceiveInfo: didReceiveInfo, onCancel: onCancel, mediaTypes: mediaTypes)
    }
}

extension ImagePicker {
    public func onCancel(_ handler: @escaping () -> ()) -> Self {
        ImagePicker(sourceType: sourceType, didReceiveInfo: didReceiveInfo, onCancel: handler, mediaTypes: mediaTypes)
    }
}

extension CustomOverlayImagePicker {
    public func onCancel(_ handler: @escaping () -> ()) -> Self {
        CustomOverlayImagePicker(sourceType: sourceType, overlayView: overlayView, didReceiveInfo: didReceiveInfo, onCancel: handler, mediaTypes: mediaTypes)
    }
}
