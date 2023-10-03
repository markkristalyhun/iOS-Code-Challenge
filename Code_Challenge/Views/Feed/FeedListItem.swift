//
//  FeedListItem.swift
//  Code_Challenge
//
//  Created by Márk Kristály on 2023. 10. 04..
//  Copyright © 2023. JOOR. All rights reserved.
//

import SwiftUI

struct FeedListItem: View {
    var userName: String
    var tweet: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Group {
                Text(userName)
                    .fontWeight(.bold)
                Text(tweet)
            }
            .foregroundColor(Colors.font)
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
}

struct FeedListItem_Previews: PreviewProvider {
    static var previews: some View {
        FeedListItem(userName: "mrTestUser", tweet: "It's a test tweet.")
    }
}
