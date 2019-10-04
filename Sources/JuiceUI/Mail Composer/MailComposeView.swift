//
//  MailComposeView.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 9/28/19.

import SwiftUI
import MessageUI

/// A SwiftUI View based on the MFMailViewController from MessageUI. Enables the user to send a mail message directly from within the app
public struct MailComposeView {
    
    
    var didCancel: (() -> ())? = nil
    var didFail: ((MFMailComposeError) -> ())? = nil
    var didSaveDraft: (() -> ())? = nil
    var didSend: (() -> ())? = nil
    var message: MailMessage? = nil
    
    /// Initializes the Mail Composer
    public init() { }
    
    func addMessage(to controller: MFMailComposeViewController) {
        if let message = message {
            if let subject = message.subject {
                controller.setSubject(subject)
            }
            controller.setToRecipients(message.to)
            controller.setCcRecipients(message.cc)
            controller.setBccRecipients(message.bcc)
            
            if let body = message.body {
                controller.setMessageBody(body, isHTML: message.isBodyHTML)
            }
            
            if let attachments = message.attachments {
                for attachment in attachments {
                    controller.addAttachmentData(attachment.data, mimeType: attachment.mimeType, fileName: attachment.fileName)
                }
            }
            
            if let preferredSendingAddress = message.preferredSendingAddress {
                controller.setPreferredSendingEmailAddress(preferredSendingAddress)
            }
        }
    }
    
    /// Indicates whether the current device is able to send email. Depends on the Mail app being installed and an account added.
    public static func canSendMail() -> Bool {
        MFMailComposeViewController.canSendMail()
    }
    
}
