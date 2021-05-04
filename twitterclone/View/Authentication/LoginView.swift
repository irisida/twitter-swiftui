//
//  LoginView.swift
//  twitterclone
//
//  Created by ed on 04/05/2021.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    
    var body: some View {
        ZStack {
            VStack {
                Image("twitter-logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipped()
                    .padding(.vertical, 60)
                    
                
                VStack {
                    CustomTextField(text: $email, placeholder: Text("Email"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.vertical)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $password, placeholder: Text("Password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.vertical)
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
        }
        .background(Color(TWITTER_BLUE))
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
