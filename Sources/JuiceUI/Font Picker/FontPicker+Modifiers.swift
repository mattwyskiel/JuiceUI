//
//  FontPicker+Modifiers.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 9/29/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import Foundation

extension FontPicker {
    public func onCancel(_ handler: @escaping () -> ()) -> Self {
        FontPicker(configuration: configuration, didPickFont: didPickFont, onCancel: handler)
    }
}
