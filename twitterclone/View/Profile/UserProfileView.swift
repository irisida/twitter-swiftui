//
//  UserProfileView.swift
//  twitterclone
//
//  Created by ed on 03/05/2021.
//

import SwiftUI

struct UserProfileView: View {
    
    @State var selectedFilter: TweetFilterOptions = .tweets
    
    var body: some View {
        ScrollView {
            VStack {
                UserProfileHeaderView()
                    .padding(.bottom)
                
                UserProfileFilterButtonsView(selectedOption: $selectedFilter)
                
                ForEach(0 ..< 9) { tweet in
                    TweetCell()
                        .padding(.horizontal)
                }
                
            }
            
            .navigationTitle("Profile")
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
