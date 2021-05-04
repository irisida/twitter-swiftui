//
//  UserProfileActionButtonView.swift
//  twitterclone
//
//  Created by ed on 03/05/2021.
//

import SwiftUI

struct UserProfileActionButtonView: View {
    
    let isCurrentUser: Bool
    
    var body: some View {
        if isCurrentUser {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Edit Profile")
                    .frame(width: 360, height: 40)
                    .background(Color(TWITTER_BLUE))
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
            })
        } else {
            HStack {
                Text("Message")
                    .frame(width: 172, height: 40)
                    .background(Color(TWITTER_BLUE))
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                
                Text("Follow")
                    .frame(width: 172, height: 40)
                    .background(Color(TWITTER_BLUE))
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
            }
        }
    }
}

struct UserProfileActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileActionButtonView(isCurrentUser: false)
    }
}
