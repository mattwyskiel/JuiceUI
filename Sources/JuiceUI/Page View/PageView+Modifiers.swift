//
//  PageView+Modifiers.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 10/1/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import Foundation

extension PageView {
    func disablePageIndicator() -> PageView {
        var copy = self
        copy.indicatorVisible = false
        return copy
    }
}

extension PageView {
    func beforeTransitionHandler(_ handler: @escaping ([Page]) -> ()) -> PageView {
        var copy = self
        copy.beforeTransitionHandler = handler
        return copy
    }
    
    func afterTransitionHandler(_ handler: @escaping (_ finishedAnimating: Bool, _ previousViews: [Page], _ transitionCompleted: Bool) -> ()) -> PageView {
        var copy = self
        copy.afterTransitionHandler = handler
        return copy
    }
    
    /* TODO: dynamically proficde spine location */
}
