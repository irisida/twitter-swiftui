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
        NavigationView {
            ZStack {
                VStack {
                    Image("twitter-logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipped()
                        .padding(.vertical, 80)
                        
                    
                    VStack (spacing: 16){
                        CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope" )
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .foregroundColor(.white)
                        
                        CustomSecureField(text: $password, placeholder: Text("Password"))
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .foregroundColor(.white)
                    }
                    
                    HStack {
                        Spacer()
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Forgot password?")
                                .font(.footnote)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.top)
                                .padding(.trailing)
                        })
                    }
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(Color(TWITTER_BLUE))
                            .frame(width: 400, height: 50)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .padding()
                    })
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: SignupView().navigationBarBackButtonHidden(true),
                        label: {
                            HStack {
                                Text("Don't have an account?")
                                    .font(.system(size: 16))
                                Text("Sign up")
                                    .font(.system(size: 16, weight: .semibold))
                                
                            }
                            .foregroundColor(.white)
                            .padding(.bottom, 48)
                        })
                    
                    
                }
            }
            .background(Color(TWITTER_BLUE))
            .ignoresSafeArea()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
