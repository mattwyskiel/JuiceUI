//
//  ShareSheet+Modifiers.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 9/29/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import UIKit

extension ShareSheet {
    
    /// Enables the caller to know when the user has completed their interaction with the Share Sheet
    /// - Parameter handler: The function that handles when the user has completed their interaction with the share sheet
    public func onComplete(_ handler: @escaping (_ activityType: UIActivity.ActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ activityError: Error?) -> Void) -> Self {
        var copy = self
        copy.onComplete = handler
        return copy
    }
}
