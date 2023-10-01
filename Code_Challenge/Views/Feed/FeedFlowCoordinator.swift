//
//  FeedFlowCoordinator.swift
//  Code_Challenge
//
//  Created by Márk Kristály on 2023. 10. 01..
//  Copyright © 2023. JOOR. All rights reserved.
//

import Foundation
import SwiftUI

protocol FeedFlowState: ObservableObject {}

struct FeedFlowCoordinator<State: FeedFlowState, Content: View>: View {
    @ObservedObject var state: State
    let content: () -> Content
    
    var body: some View {
        NavigationStack {
            content()
        }
    }
}
