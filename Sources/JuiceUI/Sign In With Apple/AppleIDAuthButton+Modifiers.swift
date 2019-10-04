//
//  AppleIDAuthButton+Modifiers.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 9/29/19.

import AuthenticationServices

extension AppleIDAuthButton {
    /// Enables the caller to handle a successful authorization.
    /// - Parameter handler: The function to handle a successful authorization
    public func onSuccess(_ handler: @escaping (ASAuthorization) -> ()) -> AppleIDAuthButton {
        var copy = self
        copy.onSuccess = handler
        return copy
    }
    
    /// Enables the caller to handle a failed authorization
    /// - Parameter handler: The function to handle a failed authorization
    public func onFailure(_ handler: @escaping (Error) -> ()) -> AppleIDAuthButton {
        var copy = self
        copy.onFailure = handler
        return copy
    }
}

extension AppleIDAuthButton {
    /// Set the style of the Sign In With Apple button
    /// - Parameter style: The style to apply to the Sign In With Apple button
    public func authButtonStyle(_ style: ASAuthorizationAppleIDButton.Style) -> AppleIDAuthButton {
        var copy = self
        copy.style = style
        return copy
    }
    
    /// Set the type for the Sign In With Apple button
    /// - Parameter type: The type for the Sign In With Apple button
    public func authButtonType(_ type: ASAuthorizationAppleIDButton.ButtonType) -> AppleIDAuthButton {
        var copy = self
        copy.type = type
        return copy
    }
}

extension AppleIDAuthButton {
    /// Set the corner radius for the Sign In with Apple button
    /// - Parameter radius: The corner radius to set
    public func cornerRadius(_ radius: CGFloat) -> AppleIDAuthButton {
        var copy = self
        copy.cornerRadius = radius
        return copy
    }
}
