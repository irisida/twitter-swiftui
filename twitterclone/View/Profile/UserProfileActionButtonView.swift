//
//  UserProfileActionButtonView.swift
//  twitterclone
//
//  Created by ed on 03/05/2021.
//

import SwiftUI

struct UserProfileActionButtonView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    
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
                    viewModel.user.isFollowed ? viewModel.unfollowUser() : viewModel.followUser()
                }, label: {
                    Text(viewModel.user.isFollowed ? "Unfollow" : "Follow")
                        .frame(width: 172, height: 40)
                        .background(Color(TWITTER_BLUE))
                        .clipShape(Capsule())
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                })
                
                NavigationLink(destination: ChatView(user: viewModel.user), label: {
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
