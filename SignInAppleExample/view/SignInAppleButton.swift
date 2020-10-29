//
//  SignInAppleButton.swift
//  SignInAppleExample
//
//  Created by Renato Lopes on 26/01/20.
//  Copyright © 2020 renato. All rights reserved.
//

import SwiftUI
import AuthenticationServices

final class SignInAppleButton: UIViewRepresentable {
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton()
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: UIViewRepresentableContext<SignInAppleButton>) {
    }
}
