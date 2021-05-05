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
    
    func signUp(fullname: String, username: String, email: String, password: String, profileImage: UIImage) {
        
        print("DEBUG-> email is   : \(email)")
        print("DEBUG-> password is: \(password)")
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("ERROR -> error: \(error.localizedDescription)")
                return
            }
            
            print("DEBUG -> successfully signed up a new User.")
        }
    }
}
