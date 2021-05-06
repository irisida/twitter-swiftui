//
//  AuthViewModel.swift
//  twitterclone
//
//  Created by ed on 05/05/2021.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var isAuthenticating = false
    @Published var error: Error?
    @Published var user: User?
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid).getDocument { (snapshot, _) in
            guard let data = snapshot?.data() else { return }
            self.user = User(dictionary: data)
            
        }
    }
    
    func logout() {
        userSession = nil
        user = nil
        try? Auth.auth().signOut()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("ERROR -> Failed to Login: \(error.localizedDescription)")
                return
            }
            
            self.userSession = result?.user
            self.fetchUser()
        }
    }
    
    // Uses UIImage type for profileImage in order to utlisise the
    // .jpegData(compressinQuality) method. This is not available
    // to the standard SwiftUI Image class at this time.
    func signUp(fullname: String, username: String, email: String, password: String, profileImage: UIImage) {
        
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        let imageFilename = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(imageFilename)
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("ERROR -> Failed to upload image error: \(error.localizedDescription)")
                return
            }
            
            storageRef.downloadURL { url, _ in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        print("ERROR -> error: \(error.localizedDescription)")
                        return
                    }
                    
                    guard let user = result?.user else { return }
                    
                    let data = ["email": email,
                                "username": username.lowercased(),
                                "fullname": fullname,
                                "profileImageUrl": profileImageUrl,
                                "id": user.uid ]
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                        self.userSession = user
                        self.fetchUser()
                    }
                }
            }
        }
    }
}
