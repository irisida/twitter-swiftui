//
//  UserProfileHeaderView.swift
//  twitterclone
//
//  Created by ed on 03/05/2021.
//

import SwiftUI
import Kingfisher

struct UserProfileHeaderView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack {
            KFImage(URL(string: viewModel.user.profileImageUrl ))
                .resizable()
                .scaledToFill()
                .frame(width:120, height: 120)
                .clipped()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .shadow(color: Color.black.opacity(0.25), radius: 7, x: 1.5, y: 3)
            
            Text(viewModel.user.fullname)
                .font(.system(size: 16, weight: .semibold))
            
            Text("@\(viewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Handy with a camera. Loves lycra")
                .padding(.top, 8)
                .font(.system(size: 16))
                .foregroundColor(.gray)
            
            HStack(alignment: .top, spacing: 32) {
                VStack {
                    Text("\(viewModel.user.stats.followers)")
                        .padding(.vertical, 4)
                        .font(.system(size: 16,weight: .semibold))
                    Text(viewModel.user.stats.followers == 1 ? "Follower" : "Followers")
                        .padding(.bottom, 4)
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                }
                
                VStack {
                    Text("\(viewModel.user.stats.following)")
                        .padding(.vertical, 4)
                        .font(.system(size: 16,weight: .semibold))
                    Text("Following")
                        .padding(.bottom, 4)
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                }
            }
            
            UserProfileActionButtonView(viewModel: viewModel)
            
            Spacer()
            
        }.padding(.top)
    }
}

//struct UserProfileHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileHeaderView()
//    }
//}
