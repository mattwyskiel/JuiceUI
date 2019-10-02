//
//  MailComposeView+Modifiers.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 10/1/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import Foundation
import MessageUI

extension MailComposeView {
    public func message(_ message: MailMessage) -> MailComposeView {
        var copy = self
        copy.message = message
        return copy
    }
}

extension MailComposeView {
    public func didSend(_ handler: @escaping () -> ()) -> MailComposeView {
        var copy = self
        copy.didSend = handler
        return copy
    }
    
    public func didFail(_ handler: @escaping (MFMailComposeError) -> ()) -> MailComposeView {
        var copy = self
        copy.didFail = handler
        return copy
    }
    
    public func didSaveDraft(_ handler: @escaping () -> ()) -> MailComposeView {
        var copy = self
        copy.didSaveDraft = handler
        return copy
    }
    
    public func didCancel(_ handler: @escaping () -> ()) -> MailComposeView {
        var copy = self
        copy.didCancel = handler
        return copy
    }
}


