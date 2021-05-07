//
//  TweetCell.swift
//  twitterclone
//
//  Created by ed on 02/05/2021.
//

import SwiftUI
import Kingfisher

struct TweetCell: View {
    
    let tweet: Tweet
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                KFImage(URL(string: tweet.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipped()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Text(tweet.fullname)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.black)
                        
                        Text("@\(tweet.username) •")
                            .foregroundColor(.gray)
                        Text("2w")
                            .foregroundColor(.gray)
                    }
                    
                    Text(tweet.caption)
                        .padding(.trailing, 8)
                        .foregroundColor(.black)
                    
                    TweetReactionsView(tweet: tweet)
                    .padding(.top, 4)
                    .padding(.trailing, 32)
                    .foregroundColor(.gray)
                }
            }
            .padding(.vertical, 8)

            Divider()
        }
        .padding(.leading, 2)
    }
}

struct TweetCell_Previews: PreviewProvider {
    static var data = [
    "id": "1",
    "uid": "2",
    "username": "ed",
    "fullname": "eddie",
    "caption": "caption text",
    "profileImageUrl": "N/A",
    "likes": 100
    ] as [String : Any]
    
    static var previews: some View {
        TweetCell(tweet: Tweet(dictionary: data))
            .previewLayout(.sizeThatFits)
    }
}
