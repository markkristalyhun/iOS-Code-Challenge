//
//  RootView.swift
//  Code_Challenge
//
//  Created by Márk Kristály on 2023. 10. 01..
//  Copyright © 2023. JOOR. All rights reserved.
//

import Foundation
import SwiftUI

struct RootView<VM: RootFlowCoordinatorStateType & RootViewModelType>: View {
    @StateObject var viewModel: VM
    
    var body: some View {
        RootFlowCoordinator(state: viewModel)
    }
}
