//
//  AppleIDAuthButton+Coordinator.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 9/29/19.

import Foundation
import AuthenticationServices

extension AppleIDAuthButton {
    public class Coordinator: NSObject, ASAuthorizationControllerDelegate {
        var requestedScopes: [ASAuthorization.Scope]
        var onSuccess: (ASAuthorization) -> ()
        var onFailure: (Error) -> ()
        
        init(requestedScopes: [ASAuthorization.Scope], onSuccess: @escaping (ASAuthorization) -> (), onFailure: @escaping (Error) -> ()) {
            self.requestedScopes = requestedScopes
            self.onSuccess = onSuccess
            self.onFailure = onFailure
        }
        
        @objc func handleAuthorizationButtonPress() {
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            request.requestedScopes = requestedScopes
            
            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = self
            authorizationController.performRequests()
        }
        
        public func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
            onSuccess(authorization)
        }
        
        public func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
            onFailure(error)
        }
    }
}
