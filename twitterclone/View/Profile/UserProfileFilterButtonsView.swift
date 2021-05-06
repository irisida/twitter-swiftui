//
//  UserProfileFilterButtonView.swift
//  twitterclone
//
//  Created by ed on 03/05/2021.
//

import SwiftUI

enum TweetFilterOptions: Int, CaseIterable {
    case tweets
    case replies
    case likes
    case media
    
    var title: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Replies"
        case .likes: return "Likes"
        case .media: return "Media"
        }
    }
}

struct UserProfileFilterButtonsView: View {
    
    @Binding var selectedOption: TweetFilterOptions
    private let underlineWidth = UIScreen.main.bounds.width / CGFloat(TweetFilterOptions.allCases.count)
    
    private var computedPadding: CGFloat {
        let rawValue = CGFloat(selectedOption.rawValue)
        let count = CGFloat(TweetFilterOptions.allCases.count)
        
        // Based on having 4 sections in the tab
        // selector we add different padding to
        // the last 2 options to keep the centered
        // look. Without adding additional padding
        //  it looks off.
        return rawValue < 2 ? (UIScreen.main.bounds.width / count * rawValue) + 16 : (UIScreen.main.bounds.width / count * rawValue) + 32
        
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ForEach(TweetFilterOptions.allCases, id: \.self) { option in
                    
                    Button(action: {
                        self.selectedOption = option
                    }, label: {
                        Text(option.title)
                            .frame(width: underlineWidth)
                            .foregroundColor(Color(TWITTER_BLUE))
                    })
                }
            }
            
            Rectangle()
                .frame(width: underlineWidth - 24, height: 3, alignment: .center)
                .foregroundColor(Color(TWITTER_BLUE))
                .padding(.leading, computedPadding)
                .animation(.spring())
        }
    }
}

struct UserProfileFilterButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileFilterButtonsView(selectedOption: .constant(.tweets))
    }
}
