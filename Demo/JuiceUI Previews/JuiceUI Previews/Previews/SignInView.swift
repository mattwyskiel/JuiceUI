//
//  SignInView.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 7/28/19.

import SwiftUI
import JuiceUI
import AuthenticationServices

struct SignInView: View {
    @State var showKeychainSuccessAlert = false
    @State var showAppleIDSuccess = false
    @State var showFailureAlert = false
    
    @State var email = ""
    @State var password = ""
    
    @State var fullName = ""
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button(action: {}) {
                Text("Log in")
            }
            Spacer()
            AppleIDAuthButton(requestedScopes: [.fullName, .email])
                .onSuccess(signInSuccess)
                .frame(height: 55)
            Spacer()
            Button(action: {}) {
                Text("Forgot Password?")
            }
            Button(action: {}) {
                Text("Create Account")
            }
        }
        .padding()
        .navigationBarTitle("Juice")
        .alert(isPresented: $showKeychainSuccessAlert) {
            Alert(title: Text("Keychain Credential Recieved"), message: Text("The app has received your selected credential from the keychain."), dismissButton: .cancel())
        }
        .alert(isPresented: $showFailureAlert) {
            Alert(title: Text("Error"), message: Text("There was an authentication error."), dismissButton: .cancel())
        }
        .alert(isPresented: $showAppleIDSuccess) {
            Alert(title: Text("Success"), message: Text("Name: " + fullName), dismissButton: .cancel())
        }
    }
    
    func handle(_ appleIDCredential: ASAuthorizationAppleIDCredential) {
        // let userIdentifier = appleIDCredential.user
        fullName = "\(appleIDCredential.fullName!.givenName!) \(appleIDCredential.fullName!.familyName!)"
        email = appleIDCredential.email!
        
        // Create an account in your system.
        // For the purpose of this demo app, store the userIdentifier in the keychain.
        /*
            do {
                try KeychainItem(service: "com.example.apple-samplecode.juice", account: "userIdentifier").saveItem(userIdentifier)
            } catch {
                print("Unable to save userIdentifier to keychain.")
            }
        */
    }
    
    func handle(_ passwordCredential: ASPasswordCredential) {
        // Sign in using an existing iCloud Keychain credential.
        let username = passwordCredential.user
        let password = passwordCredential.password
        
        // For the purpose of this demo app, show the password credential as an alert.
        DispatchQueue.main.async {
            self.email = username
            self.password = password
            self.showKeychainSuccessAlert.toggle()
        }
    }
    
    func signInSuccess(_ authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            handle(appleIDCredential)
        } else if let passwordCredential = authorization.credential as? ASPasswordCredential {
            handle(passwordCredential)
        }
    }
    
}

#if DEBUG
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
#endif
