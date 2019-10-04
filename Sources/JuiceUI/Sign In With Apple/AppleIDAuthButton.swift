//
//  AppleIDAuthButton.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 8/2/19.

import SwiftUI
import AuthenticationServices


/// A SwiftUI View based on the ASAuthorizationAppleIDButton in AuthenticationServices. Enables the user to Sign In With Apple.
public struct AppleIDAuthButton {
    
    /// Initializes the Apple ID Auth Button
    /// - Parameter requestedScopes: The permission scopes that the application is requesting
    public init(requestedScopes: [ASAuthorization.Scope]) {
        self.requestedScopes = requestedScopes
    }
    
    /* all of these properties are internal - should never be accessed directly by anyone outside */
    var requestedScopes: [ASAuthorization.Scope]

    var onSuccess: (ASAuthorization) -> () = {_ in}
    var onFailure: (Error) -> () = {_ in}
    
    var style: ASAuthorizationAppleIDButton.Style = .black
    var type: ASAuthorizationAppleIDButton.ButtonType = .default
    var cornerRadius: CGFloat? = nil
}
