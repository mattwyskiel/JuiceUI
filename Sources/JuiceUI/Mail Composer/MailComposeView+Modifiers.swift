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
    /// Adds a message to the mail composer
    /// - Parameter message: The message to be added to the mail composer
    public func message(_ message: MailMessage) -> MailComposeView {
        var copy = self
        copy.message = message
        return copy
    }
}

extension MailComposeView {
    /// Enables the caller to know when a mail message successfully sent
    /// - Parameter handler: The function to handle when a mail message successfully sent
    public func didSend(_ handler: @escaping () -> ()) -> MailComposeView {
        var copy = self
        copy.didSend = handler
        return copy
    }
    
    /// Enables the caller to know when a mail message failed to send
    /// - Parameter handler: The function to handle when a mail message failed to send
    public func didFail(_ handler: @escaping (MFMailComposeError) -> ()) -> MailComposeView {
        var copy = self
        copy.didFail = handler
        return copy
    }
    
    /// Enables the caller to know when a mail message draft was saved
    /// - Parameter handler: The function to handle when a mail message draft was saved
    public func didSaveDraft(_ handler: @escaping () -> ()) -> MailComposeView {
        var copy = self
        copy.didSaveDraft = handler
        return copy
    }
    
    /// Enables the caller to know when the user canceled the operation in the mail composer
    /// - Parameter handler: The function to handle when the user canceled the operation in the mail composer
    public func didCancel(_ handler: @escaping () -> ()) -> MailComposeView {
        var copy = self
        copy.didCancel = handler
        return copy
    }
}


