//
//  ProfileViewModel.swift
//  twitterclone
//
//  Created by ed on 06/05/2021.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var userTweets = [Tweet]()
    @Published var likedTweets = [Tweet]()
    
    init(user: User) {
        self.user = user
        checkIfUserIsfollowed()
        fetchUserTweets()
        fetchLikedTweets()
        fetchUserStats()
    }
    
    
    func tweets(forFilter filter: TweetFilterOptions) -> [Tweet] {
        // not currently exhaustive as doesn't handle media
        // and replies.
        
        switch filter {
        case .tweets: return userTweets
        case .likes: return likedTweets
        default:
            return userTweets
        }
    }
}

// MARK: - API

extension ProfileViewModel {
    
    func followUser() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(self.user.id).setData([:]) { _ in
            COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers").document(currentUid).setData([:]) { _ in
                self.user.isFollowed = true
            }
        }
    }
    
    func unfollowUser() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(self.user.id).delete { _ in
            COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers").document(currentUid).delete { _ in
                self.user.isFollowed.toggle()
            }
        }
    }
    
    func checkIfUserIsfollowed() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        guard !user.isCurrentUser else { return }
        
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(self.user.id).getDocument { snapshot, _ in
            guard let isFollowed = snapshot?.exists else { return }
            self.user.isFollowed = isFollowed
        }
    }
    
    func fetchUserTweets() {
        COLLECTION_TWEETS.whereField("uid", isEqualTo: self.user.id).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.userTweets = documents.map({ Tweet(dictionary: $0.data()) })
            
            print("Fetch user tweets")
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
                    
                    self.likedTweets = tweets
                }
            }
        }
    }
    
    func fetchUserStats() {
        let followersRef = COLLECTION_FOLLOWERS.document(user.id).collection("user-followers")
        let followingRef = COLLECTION_FOLLOWING.document(user.id).collection("user-following")
        
        followersRef.getDocuments { snapshot, _ in
            guard let followerCount = snapshot?.documents.count else { return }
            
            followingRef.getDocuments { snapshot, _ in
                guard let followingCount = snapshot?.documents.count  else { return }
                
                self.user.stats = UserStats(followers: followerCount, following: followingCount)
            }
            
            
        }
    }
    
}
