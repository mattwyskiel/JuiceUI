//
//  ShareSheet+Modifiers.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 9/29/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import UIKit

extension ShareSheet {
    public func onComplete(_ handler: @escaping (UIActivity.ActivityType?, Bool, [Any]?, Error?) -> Void) -> Self {
        var copy = self
        copy.onComplete = handler
        return copy
    }
}
