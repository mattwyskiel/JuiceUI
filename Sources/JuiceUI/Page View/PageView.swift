//
//  PageView.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 9/21/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import SwiftUI

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

struct PageView_Preview: PreviewProvider {
    static var previews: some View {
        PageViewPreview()
    }
}
