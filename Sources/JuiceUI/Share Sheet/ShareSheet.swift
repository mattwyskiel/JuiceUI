//
//  ActivityView.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 8/6/19.

import SwiftUI

/// A SwiftUI View based on UIActivityViewController in UIKit
public struct ShareSheet {
    var items: [Any]
    var customActivities: [Sharer]? = nil
    
    var onComplete: ((UIActivity.ActivityType?, Bool, [Any]?, Error?) -> Void)? = nil
    
    
    /// Initializes the Share Sheet
    /// - Parameter items: The items to share or act upon.
    /// - Parameter customSharers: Any custom sharers that can act on the data provided to the share sheet
    public init(items: [Any], customSharers: [Sharer]? = nil) {
        self.items = items
        self.customActivities = customSharers
    }
}
