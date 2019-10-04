//
//  ShareViewPreview.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 8/6/19.

import SwiftUI
import JuiceUI

struct ShareSheetPreview: View {
    @State private var showShareSheet = false
    @State private var status = ""
    let url = "https://github.com/mattwyskiel"
    var body: some View {
        VStack {
            Text(url)
            Text(status)
            Button("Share") {
                self.showShareSheet = true
            }
        }.sheet(isPresented: $showShareSheet) {
            ShareSheet(items: [URL(string: self.url)!])
            .onComplete { (activityType, completed, returnedItems, activityError) in
                if completed {
                    self.status = "completed!"
                } else {
                    self.status = "incomplete!"
                }
            }
        }
    }
}

#if DEBUG
struct ShareViewPreview_Previews: PreviewProvider {
    static var previews: some View {
        ShareSheetPreview()
    }
}
#endif
