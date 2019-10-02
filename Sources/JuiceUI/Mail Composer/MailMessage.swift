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
        
        public init(data: Data, mimeType: String, fileName: String) {
            self.data = data
            self.mimeType = mimeType
            self.fileName = fileName
        }
    }
    public var attachments: [Attachment]?
    
    public var preferredSendingAddress: String?
    
    public init(subject: String? = nil, to: [String]? = nil, cc: [String]? = nil, bcc: [String]? = nil, body: String? = nil, isBodyHTML: Bool = false, attachments: [Attachment]? = nil, preferredSendingAddress: String? = nil) {
        self.subject = subject
        self.to = to
        self.cc = cc
        self.bcc = bcc
        self.body = body
        self.isBodyHTML = isBodyHTML
        self.attachments = attachments
        self.preferredSendingAddress = preferredSendingAddress
    }
}
