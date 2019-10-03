//
//  PageViewContentBuilder.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 10/1/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import SwiftUI

/// A function builder that allows us to display different kinds of views in the Page View
@_functionBuilder
public class PageViewContentBuilder {
    public static func buildBlock(_ views: Page...) -> [UIViewController] {
        views.map(UIHostingController.init)
    }
}
