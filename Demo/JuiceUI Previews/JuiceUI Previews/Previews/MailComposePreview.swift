//
//  MailComposePreview.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 10/1/19.

import SwiftUI
import JuiceUI

struct MailComposePreview: View {
    
    let message = MailMessage(subject: "Hello, World", to: ["mwwyskiel@gmail.com"], body: "Here's a fun message for the whole family")
    
    @State var isPresenting = false
    @State var text = ""
    
    
    var body: some View {
        VStack {
            Text(text)
            Button("Send message") {
                self.isPresenting.toggle()
            }.sheet(isPresented: $isPresenting) {
                MailComposeView()
                .message(self.message)
                .didCancel {
                    self.text = "cancelled"
                }
                .didSend {
                    self.text = "sent"
                }
                .didFail { error in
                    self.text = "Error: " + error.localizedDescription
                }
                .didSaveDraft {
                    self.text = "saved draft"
                }
            }
        }
    }
}

struct MailComposePreview_Previews: PreviewProvider {
    static var previews: some View {
        MailComposePreview()
    }
}
