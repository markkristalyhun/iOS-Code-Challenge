//
//  RootViewModel.swift
//  Code_Challenge
//
//  Created by Márk Kristály on 2023. 10. 01..
//  Copyright © 2023. JOOR. All rights reserved.
//

import Foundation
import Combine
import ReactiveKit
import Swinject

protocol RootViewModelType {
}

class RootViewModel: RootViewModelType, RootFlowCoordinatorStateType {
    private let twitterClient: TwitterClientType
    
    var bag = DisposeBag()
    
    @Combine.Published var isLoggedIn: Bool
    
    init(twitterClient: TwitterClientType) {
        self.twitterClient = twitterClient
        isLoggedIn = twitterClient.isLoggedIn.value
        
        listenLoginValue()
    }
    
    func getLoginViewModel() -> any LoginFlowStateType & LoginViewModelType {
        LoginViewModel(twitterClient: Container.shared.resolve(TwitterClientType.self)!)
    }
    
    private func listenLoginValue() {
        self.twitterClient.isLoggedIn.bind(to: self, keyPath: \.isLoggedIn)
    }
}

extension RootViewModel: BindingExecutionContextProvider {
    public var bindingExecutionContext: ExecutionContext {
        return .immediateOnMain
      }
}

extension RootViewModel: DisposeBagProvider {
}
