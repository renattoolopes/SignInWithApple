//
//  LoginView.swift
//  SignInAppleExample
//
//  Created by Renato Lopes on 24/01/20.
//  Copyright © 2020 renato. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        SignInAppleButton()
            .frame(width: 200, height: 40)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
