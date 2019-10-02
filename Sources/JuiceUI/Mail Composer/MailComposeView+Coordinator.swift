//
//  MailComposeView+Coordinator.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 10/1/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import MessageUI

extension MailComposeView {
    public class Coordinator: NSObject {
        var didCancel: (() -> ())? = nil
        var didFail: ((MFMailComposeError) -> ())? = nil
        var didSaveDraft: (() -> ())? = nil
        var didSend: (() -> ())? = nil
    }
}

extension MailComposeView.Coordinator: MFMailComposeViewControllerDelegate {
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            didCancel?()
        case .failed:
            didFail?(error! as! MFMailComposeError)
        case .saved:
            didSaveDraft?()
        case .sent:
            didSend?()
        @unknown default:
            fatalError()
        }
        
        controller.presentingViewController?.dismiss(animated: true)
    }
}
