//
//  MainView.swift
//  twitterclone
//
//  Created by ed on 02/05/2021.
//

import SwiftUI

struct MainContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        Group {
            if viewModel.userSession != nil {
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
            } else {
                LoginView()
            }
        }
        
        
    }
}

struct mainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
