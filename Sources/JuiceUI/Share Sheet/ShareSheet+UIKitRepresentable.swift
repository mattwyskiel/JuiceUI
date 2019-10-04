//
//  ShareSheet+UIKitRepresentable.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 9/29/19.

import SwiftUI

extension ShareSheet: UIViewControllerRepresentable {
    public func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: items, applicationActivities: customActivities?.map { $0.uiActivity })
    }
    
    public func updateUIViewController(_ viewController: UIActivityViewController, context: Context) {
        viewController.completionWithItemsHandler = onComplete
    }
}
