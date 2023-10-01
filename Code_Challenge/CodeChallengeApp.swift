//
//  CodeChallengeApp.swift
//  Code_Challenge
//
//  Created by Márk Kristály on 2023. 09. 30..
//  Copyright © 2023. JOOR. All rights reserved.
//

import Foundation
import SwiftUI
import Swinject

@main
struct CodeChallengeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    init() {
        registerServices()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView(viewModel: Container.shared.resolve(RootViewModel.self)!)
        }
    }
    
    private func registerServices() {
        Container.shared.register(TwitterClientType.self) { _ in TwitterClient.shared }
        Container.shared.register(RootViewModel.self) { r in
            RootViewModel(twitterClient: r.resolve(TwitterClientType.self)!)
        }
    }
}
