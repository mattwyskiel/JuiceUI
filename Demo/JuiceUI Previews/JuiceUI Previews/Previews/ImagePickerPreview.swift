//
//  ImagePickerPreview.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 8/6/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import SwiftUI
import JuiceUI

struct ImagePickerPreview: View {
    @State private var showPicker = false
    @State private var imageURL: URL? = nil
    var body: some View {
        VStack {
            if (self.imageURL != nil) {
                Image(uiImage: UIImage(data: try! Data(contentsOf: imageURL!))!)
                .resizable()
                    .frame(width: 300, height: 200)
                .scaledToFit()
            }
            Button(action: { self.showPicker.toggle() }) {
                Text("Show Picker")
            }
        }.sheet(isPresented: $showPicker) {
            ImagePicker(sourceType: .photoLibrary) { info in
                self.imageURL = info[.imageURL] as? URL
            }
            .onCancel {
                self.imageURL = nil
            }
        }
    }
}

#if DEBUG
struct ImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerPreview()
    }
}
#endif
