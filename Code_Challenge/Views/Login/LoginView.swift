//
//  LoginView.swift
//  Code_Challenge
//
//  Created by Márk Kristály on 2023. 09. 30..
//  Copyright © 2023. JOOR. All rights reserved.
//

import SwiftUI

struct LoginView<VM: LoginViewModelType & LoginFlowStateType>: View {
    @State private var userName: String = ""
    @State private var password: String = ""
    
    @StateObject var viewModel: VM
    
    var body: some View {
        LoginFlowCoordinator(state: viewModel, content: content)
    }
    
    @ViewBuilder private func content() -> some View {
        GeometryReader { metrics in
            Colors.primary.overlay(
                VStack(alignment: .center, spacing: 20) {
                    Group {
                        TextField("", text: $userName, prompt: Text("login.user.placeholder").foregroundColor(Colors.placeholder))
                        SecureField("", text: $password, prompt: Text("login.password.placeholder").foregroundColor(Colors.placeholder))
                    }
                    .autocapitalization(.none)
                    .padding(.all, 8)
                    .background(Colors.secondary)
                    .foregroundColor(Colors.font)
                    .accentColor(Colors.font)
                    .cornerRadius(10)
                    
                    Button("login.button", action: {
                        viewModel.login(username: userName, password: password)
                    })
                    .padding(.vertical, 12)
                    .padding(.horizontal, 20)
                        .background(Colors.complementary)
                        .foregroundColor(Colors.font)
                        .cornerRadius(10)
                        
                }
                .frame(width: metrics.size.width * 0.7)
            ).ignoresSafeArea()
        }
    }
}
