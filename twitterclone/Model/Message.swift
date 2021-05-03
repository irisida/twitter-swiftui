//
//  Message.swift
//  twitterclone
//
//  Created by ed on 03/05/2021.
//

import Foundation

struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [
    .init(id: 0, imageName: "batman", messageText: "Hey Spidey", isCurrentUser: false),
    .init(id: 1, imageName: "spiderman", messageText: "Hey Batman", isCurrentUser: true),
    .init(id: 2, imageName: "batman", messageText: "You seen what I've seen?", isCurrentUser: false),
    .init(id: 3, imageName: "batman", messageText: "You seen WW?", isCurrentUser: false),
    .init(id: 4, imageName: "spiderman", messageText: "Aye, no bad", isCurrentUser: true)
]
