//
//  AppleIDAuthButton.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 8/2/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import SwiftUI
import AuthenticationServices

public struct AppleIDAuthButton {
    
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
