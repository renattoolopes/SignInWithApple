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
    @State private var signInDelegate:SignInWithAppleDelegate?
    var body: some View {
        SignInAppleButton()
        .frame(width: 200, height: 40)
        .onTapGesture(perform: tapSignInAppleButton)
    }
}

extension LoginView {
    private func tapSignInAppleButton() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        let controller = ASAuthorizationController.init(authorizationRequests: [request])
        signInDelegate = SignInWithAppleDelegate.init(completedSignIn: { (success) in
            if success {
                //Update UI
            } else {
                //Update UI
            }
        })
        controller.delegate = signInDelegate
        controller.performRequests()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
