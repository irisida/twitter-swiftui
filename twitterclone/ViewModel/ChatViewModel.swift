//
//  ChatViewModel.swift
//  twitterclone
//
//  Created by ed on 07/05/2021.
//

import SwiftUI
import Firebase

class ChatViewModel: ObservableObject {
    let user: User
    @Published var messages = [Message]()
    
    init(user: User) {
        self.user = user
        fetchMessages()
    }
    
    func fetchMessages() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        print("DEBUG -> uid: \(uid)")
        print("DEBUG -> user.id: \(user.id)")
        
        let query = COLLECTION_MESSAGES.document(uid).collection(user.id)
        query.order(by: "timestamp", descending: true)
        
        query.addSnapshotListener { snapshot, error in
            //guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            guard let changes = snapshot?.documentChanges else { return }
            
            print("DEBUG -> changes: \(changes)")
            
            
            changes.forEach { change in
                let messageData = change.document.data()
                guard let fromId = messageData["fromId"] as? String else { return }
                
                print("DEBUG -> fromId: \(fromId)")
                
                COLLECTION_USERS.document(fromId).getDocument { snapshot, _ in
                    guard let data = snapshot?.data() else { return }
                    let user = User(dictionary: data)
                    self.messages.append(Message(user: user, dictionary: messageData))
                }
            }
        }
        
        print("fetching messages: \(messages)")
    }
    
    func sendMessage(_ messageText: String) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        let sendingUserRef = COLLECTION_MESSAGES.document(currentUid).collection(user.id).document()
        let receivingUserRef = COLLECTION_MESSAGES.document(user.id).collection(currentUid)
        
        let sendingRecentRef = COLLECTION_MESSAGES.document(currentUid).collection("recent-messages")
        let receivingRecentRef = COLLECTION_MESSAGES.document(user.id).collection("recent-messages")
        
        let messageID = sendingUserRef.documentID
        
        let data: [String: Any] = ["text": messageText,
                                   "id": messageID,
                                   "fromId": currentUid,
                                   "toId": user.id,
                                   "timestamp": Timestamp(date: Date()) ]
        
        // update the data
        sendingUserRef.setData(data)
        receivingUserRef.document(messageID).setData(data)
        // update the recent messages 
        sendingRecentRef.document(user.id).setData(data)
        receivingRecentRef.document(currentUid).setData(data)
        
    }
}
