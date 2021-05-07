//
//  User.swift
//  twitterclone
//
//  Created by ed on 05/05/2021.
//

import Foundation
import Firebase

struct User: Identifiable {
    let id: String
    let username: String
    let fullname: String
    let email: String
    let profileImageUrl: String
    var stats: UserStats
    
    var isFollowed = false 
    var isCurrentUser: Bool {
        return Auth.auth().currentUser?.uid == self.id
    }
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.stats = UserStats(followers: 0, following: 0)
    }
}

struct UserStats {
    let followers: Int
    let following: Int
}
