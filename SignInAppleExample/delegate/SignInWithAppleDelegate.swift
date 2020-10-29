//
//  SignInWithAppleDelegate.swift
//  SignInAppleExample
//
//  Created by Renato Lopes on 26/01/20.
//  Copyright © 2020 renato. All rights reserved.
//

import Foundation
import AuthenticationServices

class SignInWithAppleDelegate: NSObject {
    
    // MARK: - Private Properties
    
    private var completedSignIn: (Result<String, Error>) -> Void
    
    // MARK: - Inits
    
    init(completedSignIn: @escaping (Result<String, Error>) -> Void) {
        self.completedSignIn = completedSignIn
    }
    
    // MARK: - Private Methods
    
    private func createAccount(credential: ASAuthorizationAppleIDCredential) {
        // User Defaults is used only test. In real case, should use Keychain or create account using an external service
        let userDefault: UserDefaults = UserDefaults()
        userDefault.set(credential.user, forKey: "user")
        userDefault.set(credential.email, forKey: "email")
        completedSignIn(.success("User: \(credential.user)\nEmail: \(credential.email ?? "N/A")"))
    }
}

// MARK: - ASAuthorizationControllerDelegate

extension SignInWithAppleDelegate: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        switch authorization.credential {
        case let appleCredential as ASAuthorizationAppleIDCredential:
            createAccount(credential: appleCredential)
        default:
            break
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        completedSignIn(.failure(error))
    }
}
