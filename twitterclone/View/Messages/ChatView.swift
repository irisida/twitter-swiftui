//
//  ChatView.swift
//  twitterclone
//
//  Created by ed on 02/05/2021.
//

import SwiftUI

struct ChatView: View {
    
    @State var messageText: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(0 ..< 10) { _ in
                        HStack {
                            Spacer()
                            Text("Test Message")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(ChatBubbleShape(isFromCurrentUser: true))
                                .padding(.horizontal)
                        }
                    }
                }
            }
            
            CustomMessageInputView(messageText: $messageText)
                .padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
