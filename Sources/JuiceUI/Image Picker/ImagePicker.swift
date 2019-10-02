//
//  ImagePicker.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 8/4/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import SwiftUI
import CoreServices

public struct ImagePicker {
    
    public enum SourceType {
        case camera, photoLibrary, savedPhotosAlbum
        
        var UIKitRepresentation: UIImagePickerController.SourceType {
            switch self {
            case .camera: return .camera
            case .photoLibrary: return .photoLibrary
            case .savedPhotosAlbum: return .savedPhotosAlbum
            }
        }
    }
    
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
    static func isSourceTypeAvailable(_ sourceType: SourceType) -> Bool {
        UIImagePickerController.isSourceTypeAvailable(sourceType.UIKitRepresentation)
    }
    
    static func availableMediaTypes(for sourceType: SourceType) -> [String]? {
        UIImagePickerController.availableMediaTypes(for: sourceType.UIKitRepresentation)
    }
}

