//
//  Page.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 10/1/19.

import SwiftUI

public struct Page: View {
    var content: AnyView
    
    /// Initializes a Page for a PageView
    /// - Parameter content: <#content description#>
    public init<Content: View>(@ViewBuilder _ content: () -> Content) {
        self.content = AnyView(content())
    }
    public var body: some View {
        content
    }
}
