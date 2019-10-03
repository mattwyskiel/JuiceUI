//
//  ImagePicker.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 8/4/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import SwiftUI
import CoreServices


/// A SwiftUI View based on the UIImagePickerController from UIKit. Enables the user to select an image from either their camera or their photos library. There
public struct ImagePicker {
    
    
    /// The source to use when picking an image or when determining available media types.
    public enum SourceType {
        
        /// Specifies the device’s built-in camera as the source for the image picker.
        case camera
        
        /// Specifies the device’s photo library as the source for the image picker controller.
        case photoLibrary
        
        /// Specifies the device’s Camera Roll album as the source for the image picker.
        case savedPhotosAlbum
        
        
        var UIKitRepresentation: UIImagePickerController.SourceType {
            switch self {
            case .camera: return .camera
            case .photoLibrary: return .photoLibrary
            case .savedPhotosAlbum: return .savedPhotosAlbum
            }
        }
    }
    
    /// Initializes the Image Picker
    /// - Parameter sourceType: The type of picker interface to be displayed.
    /// - Parameter mediaTypes: The media types that will be requested, default is a still image
    /// - Parameter didReceiveInfo: The handler to determine what to do with the picked media
    public init(sourceType: SourceType, mediaTypes: [String] = [kUTTypeImage as String], didReceiveInfo: @escaping (([UIImagePickerController.InfoKey: Any]) -> ())) {
        self.sourceType = sourceType
        self.didReceiveInfo = didReceiveInfo
        self.mediaTypes = mediaTypes
    }
    
    
    /* internal - do not use this from outside */
    init(sourceType: SourceType, didReceiveInfo: @escaping (([UIImagePickerController.InfoKey: Any]) -> ()), onCancel: (() -> Void)? = nil, mediaTypes: [String] = [kUTTypeImage as String]) {
        self.sourceType = sourceType
        self.didReceiveInfo = didReceiveInfo
        self.onCancel = onCancel
        self.mediaTypes = mediaTypes
    }
    
    var sourceType: SourceType
    var didReceiveInfo: (([UIImagePickerController.InfoKey: Any]) -> ())
    var onCancel: (() -> Void)? = nil
    var mediaTypes: [String] = [kUTTypeImage as String]
    
}

extension ImagePicker {
    /// Indicates whether the device supports picking media using the specified source type.
    public static func isSourceTypeAvailable(_ sourceType: SourceType) -> Bool {
        UIImagePickerController.isSourceTypeAvailable(sourceType.UIKitRepresentation)
    }
    
    /// Requests the available media types for the specified source type.
    public static func availableMediaTypes(for sourceType: SourceType) -> [String]? {
        UIImagePickerController.availableMediaTypes(for: sourceType.UIKitRepresentation)
    }
}

