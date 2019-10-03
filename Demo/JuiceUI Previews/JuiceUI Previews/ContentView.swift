//
//  ContentView.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 7/28/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import SwiftUI
import JuiceUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Sign In With Apple", destination: SignInView())
                NavigationLink("Image Picker", destination: ImagePickerPreview())
                NavigationLink("Share Sheet", destination: ShareSheetPreview())
                NavigationLink("Font Picker", destination: FontPickerPreview())
                NavigationLink("Page View", destination: PageViewPreview())
                if MailComposeView.canSendMail() {
                    NavigationLink("Mail Composer", destination: MailComposePreview())
                }
            }.navigationBarTitle(Text("JuiceUI Previews"))
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
