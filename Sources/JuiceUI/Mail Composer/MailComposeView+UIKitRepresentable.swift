//
//  MailComposeView+UIKitRepresentable.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 10/1/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import SwiftUI
import MessageUI

extension MailComposeView: UIViewControllerRepresentable {
    public func makeCoordinator() -> MailComposeView.Coordinator {
        Coordinator()
    }
    
    public func updateUIViewController(_ controller: MFMailComposeViewController, context: Context) {
        context.coordinator.didCancel = didCancel
        context.coordinator.didFail = didFail
        context.coordinator.didSaveDraft = didSaveDraft
        context.coordinator.didSend = didSend
    }
    
    public func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let controller = MFMailComposeViewController()
        controller.mailComposeDelegate = context.coordinator
        addMessage(to: controller)
        return controller
    }
}
