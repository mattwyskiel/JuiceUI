//
//  AppleIDAuthButton+Modifiers.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 9/29/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import AuthenticationServices

extension AppleIDAuthButton {
    public func onSuccess(_ handler: @escaping (ASAuthorization) -> ()) -> AppleIDAuthButton {
        var copy = self
        copy.onSuccess = handler
        return copy
    }
    public func onFailure(_ handler: @escaping (Error) -> ()) -> AppleIDAuthButton {
        var copy = self
        copy.onFailure = handler
        return copy
    }
}

extension AppleIDAuthButton {
    public func authButtonStyle(_ style: ASAuthorizationAppleIDButton.Style) -> AppleIDAuthButton {
        var copy = self
        copy.style = style
        return copy
    }
    
    public func authButtonType(_ type: ASAuthorizationAppleIDButton.ButtonType) -> AppleIDAuthButton {
        var copy = self
        copy.type = type
        return copy
    }
}

extension AppleIDAuthButton {
    public func cornerRadius(_ radius: CGFloat) -> AppleIDAuthButton {
        var copy = self
        copy.cornerRadius = radius
        return copy
    }
}
