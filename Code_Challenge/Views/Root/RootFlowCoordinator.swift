//
//  RootFlowCoordinator.swift
//  Code_Challenge
//
//  Created by Márk Kristály on 2023. 09. 30..
//  Copyright © 2023. JOOR. All rights reserved.
//

import Foundation
import SwiftUI
import Swinject

protocol RootFlowCoordinatorStateType: ObservableObject {
    var isLoggedIn: Bool { get }
}

enum AppLink: Hashable {}

struct RootFlowCoordinator<State: RootFlowCoordinatorStateType>: View {
    @ObservedObject var state: State
    
    var body: some View {
        ZStack {
            if state.isLoggedIn {
                feedDestination()
                    .transition(.slide)
            } else {
                loginDestination()
                    .transition(.slide)
            }
        }
        .animation(.default, value: state.isLoggedIn)
    }
    
    private func feedDestination() -> some View {
        return FeedView()
    }
    
    private func loginDestination() -> some View {
        let viewModel = LoginViewModel(twitterClient: Container.shared.resolve(TwitterClientType.self)!)
        return LoginView(viewModel: viewModel)
    }
}


