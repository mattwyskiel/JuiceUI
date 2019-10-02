//
//  AppleIDAuthButton+UIViewRepresentable.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 9/29/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import SwiftUI
import AuthenticationServices

extension AppleIDAuthButton: UIViewRepresentable {
    public func makeCoordinator() -> Coordinator {
        Coordinator(requestedScopes: requestedScopes, onSuccess: onSuccess, onFailure: onFailure)
    }
    
    public func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        ASAuthorizationAppleIDButton(type: type, style: style)
    }
    
    public func updateUIView(_ button: ASAuthorizationAppleIDButton, context: Context) {
        button.addTarget(context.coordinator, action: #selector(Coordinator.handleAuthorizationButtonPress), for: .touchUpInside)
        if cornerRadius != nil {
            button.cornerRadius = cornerRadius!
        }
    }
}
