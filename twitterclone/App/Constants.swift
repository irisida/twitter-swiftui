//
//  Constants.swift
//  twitterclone
//
//  Created by ed on 03/05/2021.
//

import SwiftUI
import Firebase

let TWITTER_BLUE = UIColor(red: 29 / 255, green: 161 / 255, blue: 242 / 255, alpha: 1.0)

let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")
let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")
