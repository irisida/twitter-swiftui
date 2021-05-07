//
//  NewMessageView.swift
//  twitterclone
//
//  Created by ed on 03/05/2021.
//

import SwiftUI

struct NewMessageView: View {
    
    @State var searchText = ""
    @Binding var willStartChat: Bool
    @Binding var willShowChat: Bool
    @Binding var user: User?
    
    @ObservedObject var viewModel = SearchViewModel(config: .newMessage)
    
    var body: some View {
        ScrollView {
            CustomSearchBar(text: $searchText)
                .padding()
        
            // make each existing chat a button that
            // when clicked will toggle the bound
            // variables and as they are state vars
            // it will update ConversationView and
            // present the list of users that we
            // can chat with
            VStack(alignment: .leading) {
                ForEach(searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)) { user in
                    Button(action: {
                        self.willShowChat.toggle()
                        self.willStartChat.toggle()
                        self.user = user
                    }, label: {
                        UserCell(user: user)
                    })
                    
                }
            }.padding(.horizontal)
        }
    }
}

//struct NewMessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewMessageView(willStartChat: .constant(true), willShowChat: .constant(true))
//    }
//}
