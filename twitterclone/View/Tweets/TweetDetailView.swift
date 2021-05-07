//
//  TweetDetailView.swift
//  twitterclone
//
//  Created by ed on 06/05/2021.
//

import SwiftUI
import Kingfisher

struct TweetDetailView: View {
    
    let tweet: Tweet
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                KFImage(URL(string: tweet.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipped()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(tweet.fullname)
                        .font(.system(size: 16, weight: .semibold))
                    
                    Text("@\(tweet.username)")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                }
            }
            
            VStack(alignment: .leading, spacing: 16) {
                Text(tweet.caption)
                
                Text("19:45 • 21/02/2021")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                
                Divider()
                
                HStack(spacing:16) {
                    HStack(spacing: 4) {
                        Text("\(tweet.likes)")
                            .font(.system(size: 16, weight: .semibold))
                    
                        Text("Retweets")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                    }
                    
                    HStack(spacing: 4) {
                        Text("10")
                            .font(.system(size: 16, weight: .semibold))
                    
                        Text("Likes")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                    }
                }
                
                Divider()
                
                TweetReactionsView(tweet: tweet)
                .foregroundColor(.gray)
                .padding(.horizontal, 4)
                
                Divider()
                
                Spacer()
            }
        }.padding()
    }
}

//struct TweetDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetDetailView()
//    }
//}
