//
//  twittercloneApp.swift
//  twitterclone
//
//  Created by ed on 02/05/2021.
//

import SwiftUI
import Firebase

@main
struct twittercloneApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainContentView().environmentObject(AuthViewModel())
        }
    }
}
