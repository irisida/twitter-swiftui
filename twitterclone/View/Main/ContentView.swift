//
//  MainView.swift
//  twitterclone
//
//  Created by ed on 02/05/2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        NavigationView {
            TabView {
                FeedView()
                    .tabItem {
                        Image(systemName: "house")
                    }
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                
                NotificationsView()
                    .tabItem {
                        Image(systemName: "bell")
                    }
                
                ConversationView()
                    .tabItem {
                        Image(systemName: "envelope")
                    }
            }
            .navigationBarTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
