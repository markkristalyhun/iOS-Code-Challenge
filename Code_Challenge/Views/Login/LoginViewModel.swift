//
//  LoginViewModel.swift
//  Code_Challenge
//
//  Created by Márk Kristály on 2023. 10. 01..
//  Copyright © 2023. JOOR. All rights reserved.
//

import Foundation

protocol LoginViewModelType {
    func login(username: String, password: String)
}

class LoginViewModel: LoginViewModelType, LoginFlowStateType {
    private let twitterClient: TwitterClientType
    
    init(twitterClient: TwitterClientType) {
        self.twitterClient = twitterClient
    }
    
    func login(username: String, password: String) {
        twitterClient.logIn(username: username, password: password)
    }
}
