//
//  Tweet.swift
//  twitterclone
//
//  Created by ed on 06/05/2021.
//

import Firebase

struct Tweet: Identifiable {
    let id: String          // tweet ID
    let uid: String         // userID of who made the tweet
    let username: String
    let fullname: String
    let caption: String
    let profileImageUrl: String
    let likes: Int
    let timestamp: Timestamp
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.caption = dictionary["caption"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.likes = dictionary["likes"] as? Int ?? 0
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
    }
    
    var timestampString: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: timestamp.dateValue(), to: Date()) ?? ""
    }
    
    var detailedTimestampString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a · dd/MM/yyyy"
        return formatter.string(from: timestamp.dateValue())
    }
}
