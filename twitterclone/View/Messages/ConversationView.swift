//
//  ConversationsView.swift
//  twitterclone
//
//  Created by ed on 02/05/2021.
//

import SwiftUI

struct ConversationView: View {
    
    @State var isShowingNewMessageView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
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
                SearchView()
            })
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
