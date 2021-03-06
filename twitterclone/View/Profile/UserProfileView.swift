//
//  UserProfileView.swift
//  twitterclone
//
//  Created by ed on 03/05/2021.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    
    @ObservedObject var viewModel: ProfileViewModel
    @State var selectedFilter: TweetFilterOptions = .tweets
    
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                UserProfileHeaderView(viewModel: viewModel)
                    .padding(.bottom)
                
                UserProfileFilterButtonsView(selectedOption: $selectedFilter)
                    .padding()
                
                ForEach(viewModel.tweets(forFilter: selectedFilter)) { tweet in
                    TweetCell(tweet: tweet)
                        .padding(.horizontal, 24)
                }
                
            }
            
            .navigationTitle("@\(viewModel.user.username)") 
        }
    }
}

//struct UserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileView()
//    }
//}
