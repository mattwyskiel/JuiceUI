//
//  MailMessage.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 10/1/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import Foundation

public struct MailMessage {
    public var subject: String?
    public var to: [String]?
    public var cc: [String]?
    public var bcc: [String]?
    public var body: String?
    public var isBodyHTML: Bool = false
    
    public struct Attachment {
        public var data: Data
        public var mimeType: String
        public var fileName: String
    }
    public var attachments: [Attachment]?
    
    public var preferredSendingAddress: String?
}
