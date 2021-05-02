//
//  UserCell.swift
//  twitterclone
//
//  Created by ed on 02/05/2021.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack(spacing: 12) {
            // image
            Image("batman")
                .resizable()
                .scaledToFill()
                .frame(width: 56, height: 56)
                .clipped()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            // vstack
            VStack(alignment: .leading, spacing: 4) {
                Text("UserName")
                    .font(.system(size: 14, weight: .semibold))
                Text("Full name")
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
            .previewLayout(.sizeThatFits)
    }
}
