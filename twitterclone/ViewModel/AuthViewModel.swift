//
//  AuthViewModel.swift
//  twitterclone
//
//  Created by ed on 05/05/2021.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    func login() {
        
    }
    
    // Uses UIImage type for profileImage in order to utlisise the
    // .jpegData(compressinQuality) method. This is not available
    // to the standard SwiftUI Image class at this time.
    func signUp(fullname: String, username: String, email: String, password: String, profileImage: UIImage) {
        
        print("DEBUG-> email is   : \(email)")
        print("DEBUG-> password is: \(password)")
        
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        let imageFilename = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(imageFilename)
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("ERROR -> Failed to upload image error: \(error.localizedDescription)")
                return
            }
            
            print("DEBUG -> successfully uploded new user photo.")
            
            storageRef.downloadURL { url, _ in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        print("ERROR -> error: \(error.localizedDescription)")
                        return
                    }
                    
                    guard let user = result?.user else { return }
                    
                    let data = ["email": email,
                                "username": username,
                                "fullname": fullname,
                                "profileImageUrl": profileImageUrl,
                                "uid": user.uid ]
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                        print("DEBUG -> successfully signed up a new User.")
                    }
                    
                    
                }
            }
            
            
        }
        
        
    }
}
