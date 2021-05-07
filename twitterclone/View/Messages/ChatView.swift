//
//  ChatView.swift
//  twitterclone
//
//  Created by ed on 02/05/2021.
//

import SwiftUI

struct ChatView: View {
    
    let user: User
    @ObservedObject var viewModel: ChatViewModel
    @State var messageText: String = ""
    
    init(user: User) {
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.messages) { message in
                        MessageView(message: message)
                    }
                }
            }.padding(.top)
            
            CustomMessageInputView(messageText: $messageText, viewModel: viewModel)
                .padding()
                
        }.navigationTitle(user.username)
    }
}

//struct ChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatView()
//    }
//}
