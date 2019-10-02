//
//  ActivityView.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 8/6/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import SwiftUI

public struct ShareSheet {
    var items: [Any]
    var customActivities: [Sharer]? = nil
    
    var onComplete: ((UIActivity.ActivityType?, Bool, [Any]?, Error?) -> Void)? = nil
    
    public init(items: [Any], customActivities: [Sharer]? = nil) {
        self.items = items
        self.customActivities = customActivities
    }
}
