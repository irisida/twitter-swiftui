//
//  ProfileViewModel.swift
//  twitterclone
//
//  Created by ed on 06/05/2021.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
    let user: User
    @Published var isFollowed = false
    @Published var userTweets = [Tweet]()
    @Published var likedTweets = [Tweet]()
    
    init(user: User) {
        self.user = user
        checkIfUserIsfollowed()
        fetchUserTweets()
        fetchLikedTweets()
    }
    
    func followUser() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(self.user.id).setData([:]) { _ in
            COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers").document(currentUid).setData([:]) { _ in
                self.isFollowed = true
            }
        }
    }
    
    func unfollowUser() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(self.user.id).delete { _ in
            COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers").document(currentUid).delete { _ in
                self.isFollowed.toggle()
            }
        }
    }
    
    func checkIfUserIsfollowed() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(self.user.id).getDocument { snapshot, _ in
            guard let isFollowed = snapshot?.exists else { return }
            self.isFollowed = isFollowed
        }
    }
    
    func fetchUserTweets() {
        COLLECTION_TWEETS.whereField("uid", isEqualTo: self.user.id).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.userTweets = documents.map({ Tweet(dictionary: $0.data()) })
            
            print(self.userTweets)
        }
    }
    
    func fetchLikedTweets() {
        var tweets = [Tweet]()
        COLLECTION_USERS.document(user.id).collection("user-likes").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let tweetIDs = documents.map({ $0.documentID })
            
            tweetIDs.forEach { id in
                COLLECTION_TWEETS.document(id).getDocument { snapshot, _ in
                    guard let data = snapshot?.data() else { return }
                    
                    let tweet = Tweet(dictionary: data)
                    tweets.append(tweet)
                    
                    guard tweets.count == tweetIDs.count else { return }
                }
            }
            
            // update the @Published var in one go
            self.likedTweets = tweets
        }
    }
}
