//
//  TweetReactionsViewModel.swift
//  twitterclone
//
//  Created by ed on 07/05/2021.
//

import SwiftUI
import Firebase

class TweetReactionsViewModel: ObservableObject {
    let tweet: Tweet
    @Published var didLike = false
    
    init(tweet: Tweet) {
        self.tweet = tweet
        checkIfUserLikedTweet()
    }
    
    func likeTweet() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_TWEETS.document(tweet.id).updateData(["likes": tweet.likes + 1]) { _ in
            COLLECTION_TWEETS.document(self.tweet.id).collection("tweet-likes").document(uid).setData([:]) { _ in
                COLLECTION_USERS.document(uid).collection("user-likes").document(self.tweet.id).setData([:]) { _ in
                    self.didLike = true
                }
            }
        }
    }
    
    func unlikeTweet() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_TWEETS.document(tweet.id).updateData(["likes": tweet.likes - 1]) { _ in
            COLLECTION_TWEETS.document(self.tweet.id).collection("tweet-likes").document(uid).delete { _ in
                COLLECTION_USERS.document(uid).collection("user-likes").document(self.tweet.id).delete { _ in
                    self.didLike = false
                }
            }
        }
    }
    
    func checkIfUserLikedTweet() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid).collection("user-likes").document(tweet.id).getDocument { snapshot, _ in
            guard let didLike = snapshot?.exists else { return }
            self.didLike = didLike
        }
    }
}
