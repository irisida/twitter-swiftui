//
//  Message.swift
//  twitterclone
//
//  Created by ed on 03/05/2021.
//

import Foundation
import Firebase

struct Message: Identifiable {
    let id: String
    let text: String
    let user: User
    let toId: String
    let fromId: String
    let isFromCurrentUser: Bool
    let timestamp: Timestamp
    
    var chatPartnerId: String { return isFromCurrentUser ? toId : fromId }
    
    init(user: User, dictionary: [String:Any]) {
        self.id = dictionary["id"] as? String ?? ""
        self.toId = dictionary["toid"] as? String ?? ""
        self.fromId = dictionary["fromId"] as? String ?? ""
        self.isFromCurrentUser = fromId == AuthViewModel.shared.userSession?.uid
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.user = user
        self.text = dictionary["text"] as? String ?? ""
    }
}


struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [
    .init(id: 0, imageName: "batman", messageText: "Hi Peter", isCurrentUser: false),
    .init(id: 1, imageName: "spiderman", messageText: "Hi Bruce", isCurrentUser: true),
    .init(id: 2, imageName: "batman", messageText: "This is a longer chat message", isCurrentUser: false),
    .init(id: 3, imageName: "batman", messageText: "And this is a longer response for the purpose of showing multiple lines.", isCurrentUser: false),
    .init(id: 4, imageName: "spiderman", messageText: "Short message", isCurrentUser: true),
    .init(id: 5, imageName: "batman", messageText: "OK  ", isCurrentUser: false),
]
