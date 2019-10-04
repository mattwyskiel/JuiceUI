//
//  PageView.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 9/21/19.

import SwiftUI

/// A SwiftUI View based on the UIPageViewController from UIKit. Enables the creation of paginated views.
public struct PageView {
    
    /* Do not use any of these properties outside the class*/
    var transitionStyle: UIPageViewController.TransitionStyle
    var navigationOrientation: UIPageViewController.NavigationOrientation
    
    var transitionAnimated = true
    var beforeTransitionHandler: (([Page]) -> ())? = nil
    var afterTransitionHandler: ((Bool, [Page], Bool) -> ())? = nil
    
    var indicatorVisible = true
    
    var pages: [UIViewController]
    
    var interPageSpacing: CGFloat?
    
    var spineLocation: UIPageViewController.SpineLocation? = nil
    
    
    /// Initializes the PageView
    /// - Parameter transitionStyle: The style for transitions between pages. Default is `scroll`
    /// - Parameter navigationOrientation: The orientation of the page-by-page navigation. Default is `horizontal`
    /// - Parameter interPageSpacing: Space between pages, in points; if applicable. Default is `nil`
    /// - Parameter spineLocation: Location of the spine, if applicable. Default is `nil`
    /// - Parameter pages: The pages to be displayed
    public init(transitionStyle: UIPageViewController.TransitionStyle = .scroll,
         navigationOrientation: UIPageViewController.NavigationOrientation = .horizontal,
         interPageSpacing: CGFloat? = nil,
         spineLocation: UIPageViewController.SpineLocation? = nil,
         @PageViewContentBuilder pages: () -> [UIViewController]) {
        
        self.transitionStyle = transitionStyle
        self.navigationOrientation = navigationOrientation
        self.interPageSpacing = interPageSpacing
        self.spineLocation = spineLocation
        self.pages = pages()
    }
    
}
