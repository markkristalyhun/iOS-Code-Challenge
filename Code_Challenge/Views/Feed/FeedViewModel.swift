//
//  FeedViewModel.swift
//  Code_Challenge
//
//  Created by Márk Kristály on 2023. 10. 01..
//  Copyright © 2023. JOOR. All rights reserved.
//

import Foundation

protocol FeedViewModelType: ObservableObject {
    var tweets: [Tweet] { get }
    func logout()
}

class FeedViewModel: FeedViewModelType, FeedFlowState {
    private let twitterClient: TwitterClientType
    
    @Published var tweets: [Tweet]
    
    init(twitterClient: TwitterClientType) {
        self.twitterClient = twitterClient
        tweets = twitterClient.loadTimeline()
    }
    
    func logout() {
        twitterClient.logOut()
    }
}
