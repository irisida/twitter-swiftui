//
//  ConversationsView.swift
//  twitterclone
//
//  Created by ed on 02/05/2021.
//

import SwiftUI

struct ConversationView: View {
    
    @State var isShowingNewMessageView = false
    @State var willStartChat = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            // A sheet of nav links to chats is presented
            // on the top layer of the ZStack because the
            // var isShowingNewMessageView is true.
            // When one of these links is clicked it will
            // open the related chat. 
            NavigationLink(
                destination: ChatView(),
                isActive: $willStartChat,
                label: {
                    Text("")
                })
            
            
            ScrollView {
                VStack {
                    ForEach(0 ..< 20) { _ in
                        NavigationLink(
                            destination: ChatView(),
                            label: {
                                ConversationCell()
                            })
                        
                    }
                }
            }
            
            // the FAB button triggers a sheet to that
            // presents a list of users we can interact
            // with and allowing us to select a user
            // with which to begin a chat.
            Button(action: {
                self.isShowingNewMessageView.toggle()
            }, label: {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .padding()
            .sheet(isPresented: $isShowingNewMessageView, content: {
                NewMessageView(willStartChat: $willStartChat,
                               willShowChat: $isShowingNewMessageView)
            })
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
