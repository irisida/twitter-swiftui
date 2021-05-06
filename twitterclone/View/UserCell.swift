//
//  UserCell.swift
//  twitterclone
//
//  Created by ed on 02/05/2021.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user: User
    
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                // image
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipped()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                // vstack
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.username)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.black)
                    Text(user.fullname)
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                }
                
                Spacer()
            }
            .padding(.vertical, 8)
            
            Divider()
        }
    }
}

//struct UserCell_Previews: PreviewProvider {
//    static let user = User(id: 1, username: "ed", fullname: "ed", email: "ed@ed.io", profileImageUrl: "ed.url")
//
//    static var previews: some View {
//        UserCell(user: user)
//            .previewLayout(.sizeThatFits)
//    }
//}
