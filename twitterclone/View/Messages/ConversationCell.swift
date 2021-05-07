//
//  ConversationCell.swift
//  twitterclone
//
//  Created by ed on 02/05/2021.
//

import SwiftUI
import Kingfisher

struct ConversationCell: View {
    let message: Message
    
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                // image
                KFImage(URL(string: message.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipped()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                // create the message summary body of
                // the username and a maximum of two
                // lines of the message text after
                // which the text is cut off with ...
                VStack(alignment: .leading, spacing: 4) {
                    Text(message.user.fullname)
                        .font(.system(size: 14, weight: .semibold))
                    Text(message.text)
                        .font(.system(size: 14))
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                }
                // Add a foreground color to override
                // the automatic blue tint that will be
                // applied to components being wrapped
                // as a NavigationLink. 
                .foregroundColor(.black)
                
                Spacer()
            }.padding(.horizontal)
            
            Divider()
        }
    }
}

//struct ConversationCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ConversationCell()
//            .previewLayout(.sizeThatFits)
//    }
//}
