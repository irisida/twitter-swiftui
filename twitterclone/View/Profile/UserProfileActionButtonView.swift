//
//  UserProfileActionButtonView.swift
//  twitterclone
//
//  Created by ed on 03/05/2021.
//

import SwiftUI

struct UserProfileActionButtonView: View {
    @Binding var isFollowed: Bool
    let viewModel: ProfileViewModel
    
    
    var body: some View {
        if viewModel.user.isCurrentUser {
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
                Button(action: {
                    isFollowed ? viewModel.unfollowUser() : viewModel.followUser()
                }, label: {
                    Text(isFollowed ? "Unfollow" : "Follow")
                        .frame(width: 172, height: 40)
                        .background(Color(TWITTER_BLUE))
                        .clipShape(Capsule())
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                })
                
                Button(action: {
                    print("DM message here")
                }, label: {
                    Text("Message")
                        .frame(width: 172, height: 40)
                        .background(Color(TWITTER_BLUE))
                        .clipShape(Capsule())
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                })
            }
        }
    }
}

//struct UserProfileActionButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileActionButtonView(isCurrentUser: false)
//    }
//}
