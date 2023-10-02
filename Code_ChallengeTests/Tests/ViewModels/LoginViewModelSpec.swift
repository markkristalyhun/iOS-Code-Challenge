//
//  LoginViewModelSpec.swift
//  Code_ChallengeTests
//
//  Created by Márk Kristály on 2023. 10. 03..
//  Copyright © 2023. JOOR. All rights reserved.
//

@testable import Code_Challenge
import Nimble
import Quick
import ReactiveKit

class LoginViewModelSpec: QuickSpec {
    override func spec() {
        describe("LoginViewModel") {
            var viewModel: LoginViewModel!
            var twitterClientMock: TwitterClientMock!
            
            beforeEach {
                twitterClientMock = TwitterClientMock()
                viewModel = LoginViewModel(twitterClient: twitterClientMock)
            }
            
            afterEach {
                viewModel = nil
                twitterClientMock = nil
            }
 
            it("should call the login method on the TwitterClient") {
                let username = "testUser"
                let password = "testPassword"
                
                viewModel.login(username: username, password: password)
                expect(twitterClientMock.didCallLogIn) == true
                expect(twitterClientMock.logInUsername) == username
                expect(twitterClientMock.logInPassword) == password
            }
        }
    }
}

private class TwitterClientMock: TwitterClientType {
    var isLoggedIn = ReactiveKit.Property<Bool>(false)
    
    func logOut() {
    }
    
    func loadTimeline() -> [Code_Challenge.Tweet] {
        return []
    }
    
    var didCallLogIn = false
    var logInUsername: String?
    var logInPassword: String?
    
    func logIn(username: String, password: String) {
        didCallLogIn = true
        logInUsername = username
        logInPassword = password
    }
}

