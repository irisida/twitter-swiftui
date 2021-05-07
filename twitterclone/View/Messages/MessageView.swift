//
//  MessageView.swift
//  twitterclone
//
//  Created by ed on 03/05/2021.
//

import SwiftUI
import Kingfisher

struct MessageView: View {
    let message: Message
    
    var body: some View {
        HStack {
            
            if message.isFromCurrentUser {
                Spacer()
                Text(message.text)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(ChatBubbleShape(isFromCurrentUser: true))
                    .padding(.horizontal)
            } else {
                HStack(alignment: .bottom) {
                    KFImage(URL(string: message.user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    Text(message.text)
                        .padding()
                        .background(Color(.systemGray5))
                        .foregroundColor(.black)
                        .clipShape(ChatBubbleShape(isFromCurrentUser: false))
                }.padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

//struct MessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageView(message: MockMessage.init(id: 1, imageName: "me", messageText: "you", isCurrentUser: true)).previewLayout(.sizeThatFits)
//
//    }
//}
