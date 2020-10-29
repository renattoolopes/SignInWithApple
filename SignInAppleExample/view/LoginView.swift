//
//  LoginView.swift
//  SignInAppleExample
//
//  Created by Renato Lopes on 24/01/20.
//  Copyright © 2020 renato. All rights reserved.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    
    // MARK: - Private Properties
    
    @State private var signInDelegate: SignInWithAppleDelegate?
    
    
    // MARK: - View
    
    var body: some View {
        SignInAppleButton()
            .frame(width: 200, height: 40)
            .onTapGesture(perform: tapSignInAppleButton)
    }
    
}

// MARK: - LoginView Extension

extension LoginView {
    
    // MARK: - Private Methods
    
    private func tapSignInAppleButton() {
        let request: ASAuthorizationAppleIDRequest = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller: ASAuthorizationController = ASAuthorizationController(authorizationRequests: [request])
        
        signInDelegate = SignInWithAppleDelegate(completedSignIn: { (result) in
            switch result {
            case .success(let text):
                print(text)
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
        
        controller.delegate = signInDelegate
        controller.performRequests()
    }
}

// MARK: - LoginView Previews

struct LoginView_Previews: PreviewProvider {
    
    // MARK: - Previews
    
    static var previews: some View {
        LoginView()
    }
}
