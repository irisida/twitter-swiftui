//
//  FeedView.swift
//  twitterclone
//
//  Created by ed on 02/05/2021.
//

import SwiftUI

struct FeedView: View {
    
    @State var isShowingNewTweetView = false
    
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    ForEach(0 ..< 20) { _ in
                        TweetCell()
                    }
                }
            }
            
            Button(action: {
                self.isShowingNewTweetView.toggle()
            }, label: {
                Image("tweet")
                    .resizable()
                    .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(TWITTER_BLUE))
            .foregroundColor(.white)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .padding()
            .shadow(color: Color.black.opacity(0.25), radius: 7, x: 1.5, y: 3)
            .fullScreenCover(isPresented: $isShowingNewTweetView) {
                NewTweetView(isPresented: $isShowingNewTweetView)
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
