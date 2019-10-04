//
//  PageViewPreview.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 9/27/19.

import SwiftUI
import JuiceUI

extension Color {
    static var veryLightGray: Color {
        return Color(UIColor(named: "PageViewBackground")!)
    }
}

struct PageViewPreview: View {
    
    var body: some View {
        ZStack{
            Color.veryLightGray.edgesIgnoringSafeArea(.all)
            PageView {
                Page {
                    ZStack {
                        Color.blue
                        Text("Hello")
                    }
                }
                Page {
                    ZStack {
                        Color.red
                        Text("World")
                    }
                }
                Page {
                    Text("This Works!!!")
                }
            }
        }
    }

}

struct PageViewPreview_Previews: PreviewProvider {
    static var previews: some View {
        PageViewPreview()
    }
}
