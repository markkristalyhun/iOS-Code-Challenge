//
//  FeedView.swift
//  Code_Challenge
//
//  Created by Márk Kristály on 2023. 09. 30..
//  Copyright © 2023. JOOR. All rights reserved.
//

import SwiftUI

struct FeedView<VM: FeedViewModelType & FeedFlowState>: View {
    @StateObject var viewModel: VM
    
    var body: some View {
        FeedFlowCoordinator(state: viewModel, content: content)
    }
    
    @ViewBuilder private func content() -> some View {
        GeometryReader { metrics in
            List {
                ForEach(viewModel.tweets, id: \.id) { tweet in
                    VStack(alignment: .leading, spacing: 20) {
                        VStack(alignment: .leading, spacing: 10) {
                            Group {
                                Text(tweet.user)
                                    .fontWeight(.bold)
                                Text(tweet.content)
                            }
                            .foregroundColor(Colors.font)
                        }
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        Divider()
                            .frame(width: metrics.size.width, height: 0.5)
                            .overlay(Colors.font)
                    }
                    .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    .listRowBackground(Colors.primary)
                    .listRowSeparator(.automatic)
                }
                
            }
            .listStyle(.plain)
            .navigationTitle("feed.title")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("logout.button", action: {
                    viewModel.logout()
                })
                .foregroundColor(Colors.font)
            }
            .toolbarBackground(Colors.primary, for: .navigationBar)
            .background(Colors.primary)
            .scrollContentBackground(.hidden)
        }
    }
}

//#Preview {
//    FeedView()
//}
