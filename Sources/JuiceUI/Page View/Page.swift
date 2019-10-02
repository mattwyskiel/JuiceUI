//
//  Page.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 10/1/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import SwiftUI

public struct Page: View {
    var content: AnyView
    public init<Content: View>(@ViewBuilder _ content: () -> Content) {
        self.content = AnyView(content())
    }
    public var body: some View {
        content
    }
}
