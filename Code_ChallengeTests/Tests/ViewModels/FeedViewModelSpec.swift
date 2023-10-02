//
//  FeedViewModelSpec.swift
//  Code_ChallengeTests
//
//  Created by Márk Kristály on 2023. 10. 03..
//  Copyright © 2023. JOOR. All rights reserved.
//

@testable import Code_Challenge
import Nimble
import Quick
import ReactiveKit

class FeedViewModelSpec: QuickSpec {
    override func spec() {
        describe("FeedViewModel") {
            var viewModel: FeedViewModel!
            var twitterClientMock: TwitterClientMock!
            
            beforeEach {
                twitterClientMock = TwitterClientMock()
                viewModel = FeedViewModel(twitterClient: twitterClientMock)
            }
            
            afterEach {
                viewModel = nil
                twitterClientMock = nil
            }
            
            
            it("should call the logout method on the TwitterClient") {
                viewModel.logout()
                expect(twitterClientMock.didCallLogout) == true
                expect(twitterClientMock.isLoggedIn.value).to(beTrue())
            }
            
            it("should have tweets loaded after init") {
                expect(viewModel.tweets).to(haveCount(2))
                expect(viewModel.tweets[0].id).to(be(1))
                expect(viewModel.tweets[0].id).to(be(2))
            }
        }
    }
}

private class TwitterClientMock: TwitterClientType {
    var isLoggedIn = Property<Bool>(false)
    
    func logIn(username: String, password: String) {
        isLoggedIn.value = true
    }
    
    var didCallLogout = false
    
    var loadTimelineReturnValue: [Tweet] = [
        Tweet(id: 1, content: "test content 1", user: "test user 1"),
        Tweet(id: 2, content: "test content 2", user: "test user 3")
    ]
    
    func loadTimeline() -> [Tweet] {
        return loadTimelineReturnValue
    }
    
    func logOut() {
        didCallLogout = true
        isLoggedIn.value = false
    }
}

