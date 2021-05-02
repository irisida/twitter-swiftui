//
//  SearchView.swift
//  twitterclone
//
//  Created by ed on 02/05/2021.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    
    var body: some View {
        ScrollView {
            CustomSearchBar(text: $searchText)
                .padding()
        
            VStack(alignment: .leading) {
                ForEach(0 ..< 10) { _ in
                    UserCell()
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
