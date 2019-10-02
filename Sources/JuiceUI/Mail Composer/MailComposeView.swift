//
//  MailComposeView.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 9/28/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import SwiftUI
import MessageUI

public struct MailComposeView {
    
    
    var didCancel: (() -> ())? = nil
    var didFail: ((MFMailComposeError) -> ())? = nil
    var didSaveDraft: (() -> ())? = nil
    var didSend: (() -> ())? = nil
    var message: MailMessage? = nil
    
    
    
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
    
    public static func canSendMail() -> Bool {
        MFMailComposeViewController.canSendMail()
    }
    
}

struct MailComposeView_Previews: PreviewProvider {
    
    static var previews: some View {
        MailComposePreview()
    }
}
