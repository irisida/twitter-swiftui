//
//  UserProfileHeaderView.swift
//  twitterclone
//
//  Created by ed on 03/05/2021.
//

import SwiftUI

struct UserProfileHeaderView: View {
    var body: some View {
        VStack {
            Image("spiderman")
                .resizable()
                .scaledToFill()
                .frame(width:120, height: 120)
                .clipped()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .shadow(color: Color.black.opacity(0.25), radius: 7, x: 1.5, y: 3)
            
            Text("Peter Parker")
                .font(.system(size: 16, weight: .semibold))
            
            Text("@spidey")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Handy with a camera. Loves lycra")
                .padding(.top, 8)
                .font(.system(size: 16))
                .foregroundColor(.gray)
            
            HStack(alignment: .top, spacing: 32) {
                VStack {
                    Text("10")
                        .padding(.vertical, 4)
                        .font(.system(size: 16,weight: .semibold))
                    Text("Followers")
                        .padding(.bottom, 4)
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                }
                
                VStack {
                    Text("110")
                        .padding(.vertical, 4)
                        .font(.system(size: 16,weight: .semibold))
                    Text("Following")
                        .padding(.bottom, 4)
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                }
            }
            
            UserProfileActionButtonView(isCurrentUser: false)
            
            Spacer()
            
        }.padding(.top)
    }
}

struct UserProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileHeaderView()
    }
}
