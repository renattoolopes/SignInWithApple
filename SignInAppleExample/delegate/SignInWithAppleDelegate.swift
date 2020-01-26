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
    private var completedSignIn: (Bool) -> Void
    init(completedSignIn: @escaping (Bool) -> Void) {
        self.completedSignIn = completedSignIn
    }
}
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
        completedSignIn(false)
    }
    
    private func createAccount(credential: ASAuthorizationAppleIDCredential) {
        let userDefault = UserDefaults.init()
        userDefault.set(credential.user, forKey: "user")
        userDefault.set(credential.fullName, forKey: "name")
        userDefault.set(credential.email, forKey: "email")
        completedSignIn(true)
        
    }
}
