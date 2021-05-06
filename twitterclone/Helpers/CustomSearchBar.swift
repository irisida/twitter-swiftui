//
//  CustomSearchBar.swift
//  twitterclone
//
//  Created by ed on 02/05/2021.
//

import SwiftUI

struct CustomSearchBar: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    })
                .padding(.horizontal, 10)
        }
    }
}

struct CustomSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomSearchBar(text: .constant("Search"))
            .previewLayout(.sizeThatFits)
    }
}
