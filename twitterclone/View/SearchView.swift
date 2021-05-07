//
//  SearchView.swift
//  twitterclone
//
//  Created by ed on 02/05/2021.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    @ObservedObject var viewModel = SearchViewModel(config: .search)
    
    
    var body: some View {
        ScrollView {
            CustomSearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading) {
                ForEach(searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)) { user in
                    NavigationLink(
                        destination: CustomLazyView(UserProfileView(user: user)),
                        label: {
                            UserCell(user: user)
                        })
                    
                }
            }.padding(.horizontal)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
