//
//  FeedViewModel.swift
//  twitterclone
//
//  Created by ed on 06/05/2021.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    
    init() {
        fetchTweets()
    }
    
    func fetchTweets() {
        COLLECTION_TWEETS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.tweets = documents.map({ Tweet(dictionary: $0.data()) })
        }
    }
}
