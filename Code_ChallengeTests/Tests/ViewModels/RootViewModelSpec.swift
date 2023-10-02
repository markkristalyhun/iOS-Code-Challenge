//
//  RootViewModelSpec.swift
//  Code_ChallengeTests
//
//  Created by Márk Kristály on 2023. 10. 03..
//  Copyright © 2023. JOOR. All rights reserved.
//

@testable import Code_Challenge
import Nimble
import Quick
import ReactiveKit

class RootViewModelSpec: QuickSpec {
    override func spec() {
        describe("RootViewModel") {
            var viewModel: RootViewModel!
            var twitterClientMock: TwitterClientMock!

            beforeEach {
                twitterClientMock = TwitterClientMock()
                viewModel = RootViewModel(twitterClient: twitterClientMock)
            }

            afterEach {
                viewModel = nil
                twitterClientMock = nil
            }

            it("should update isLoggedIn when login or logout happens") {
                twitterClientMock.logIn(username: "testuser", password: "testpass")
                expect(twitterClientMock.didCallLogin).to(beTrue())
                expect(viewModel.isLoggedIn) == true

                twitterClientMock.logOut()
                expect(twitterClientMock.didCallLogout).to(beTrue())
                expect(viewModel.isLoggedIn) == false
            }
        }
    }
}

private class TwitterClientMock: TwitterClientType {
    var isLoggedIn = Property<Bool>(false)
    
    private(set) var didCallLogin = false
    private(set) var didCallLogout = false
    
    func logIn(username: String, password: String) {
        didCallLogin = true
        isLoggedIn.value = true
    }
    
    func logOut() {
        didCallLogout = true
        isLoggedIn.value = false
    }
    
    func loadTimeline() -> [Code_Challenge.Tweet] {
        return []
    }
}

