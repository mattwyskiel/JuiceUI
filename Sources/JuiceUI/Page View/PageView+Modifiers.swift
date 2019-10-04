//
//  PageView+Modifiers.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 10/1/19.

import Foundation

extension PageView {
    
    /// Disables the page indicator on the PageView, as it is on by default.
    public func disablePageIndicator() -> PageView {
        var copy = self
        copy.indicatorVisible = false
        return copy
    }
}

extension PageView {
    
    /// Enables the caller to know when a page transition is about to occur.
    /// - Parameter handler: The function to handle when a page transition is about to occur.
    public func beforeTransitionHandler(_ handler: @escaping ([Page]) -> ()) -> PageView {
        var copy = self
        copy.beforeTransitionHandler = handler
        return copy
    }
    
    /// Enables the caller to know when a page transition has (or should be) finished.
    /// - Parameter handler: The function to handle when a page transition has (or should be) finished.
    func afterTransitionHandler(_ handler: @escaping (_ finishedAnimating: Bool, _ previousViews: [Page], _ transitionCompleted: Bool) -> ()) -> PageView {
        var copy = self
        copy.afterTransitionHandler = handler
        return copy
    }
    
    /* TODO: dynamically proficde spine location */
}
