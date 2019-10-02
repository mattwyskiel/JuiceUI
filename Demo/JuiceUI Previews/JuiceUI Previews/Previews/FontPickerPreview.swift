//
//  FontPickerPreview.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 8/6/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import SwiftUI
import JuiceUI

struct FontPickerPreview: View {
    @State private var showPicker = false
    @State private var fontName: String? = nil
    
    var body: some View {
        VStack {
            Text("Here is some funky text to add your funky font to.")
                .font(Font.custom(fontName ?? "Arial", size: 17))
                .lineLimit(3)
                .padding()
            Button(action: { self.showPicker.toggle() }) { Text("Font Picker") }
        }.sheet(isPresented: $showPicker) {
            NavigationView {
                FontPicker(didPickFont: { font in
                    self.fontName = font.postscriptName
                })
            }
        }
    }
}

#if DEBUG
struct FontPickerPreview_Previews: PreviewProvider {
    static var previews: some View {
        FontPickerPreview()
    }
}
#endif
