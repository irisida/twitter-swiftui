//
//  NewTweetView.swift
//  twitterclone
//
//  Created by ed on 04/05/2021.
//

import SwiftUI

struct NewTweetView: View {
    
    @Binding var isPresented: Bool
    @State var captionText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack (alignment: .top){
                    Image("spiderman")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipped()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    CustomTextArea(text: $captionText, placeholder: "What's happeing?")
                    
                    Spacer()
                }
                .padding()
                .navigationBarItems(
                    leading: Button(action: {
                        isPresented.toggle()
                    }, label: {
                        Text("Cancel")
                    }), trailing: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Tweet")
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .foregroundColor(.white)
                            .background(Color(TWITTER_BLUE))
                            .clipShape(Capsule())
                }))
                
                Spacer()
            }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView(isPresented: .constant(true))
    }
}
