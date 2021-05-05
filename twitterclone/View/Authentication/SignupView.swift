//
//  SignupView.swift
//  twitterclone
//
//  Created by ed on 04/05/2021.
//

import SwiftUI

struct SignupView: View {
    
    @State var email = ""
    @State var password = ""
    @State var fullname = ""
    @State var username = ""
    @State var willShowImagePicker = false
    
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject var viewModel = AuthViewModel()
    
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    willShowImagePicker.toggle()
                }, label: {
                    ZStack {
                        if let image = image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 110, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .clipped()
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white,lineWidth: 2))
                                .padding(.top, 72)
                                .padding(.bottom, 56)
                        } else {
                        Image(systemName: "camera.circle")
                            .font(.system(size: 82, weight: .ultraLight))
                            .frame(width: 110, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(.top, 72)
                            .padding(.bottom, 56)
                            .foregroundColor(.white)
                        }
                    }
                })
                .contentShape(Rectangle())
                .sheet(isPresented: $willShowImagePicker, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedUIImage)
                })
                
                
                VStack (spacing: 16){
                    CustomTextField(text: $fullname, placeholder: Text("Full Name"), imageName: "person" )
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .autocapitalization(.words)
                    
                    CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person.crop.circle" )
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope" )
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    CustomSecureField(text: $password, placeholder: Text("Password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                }.padding(.bottom)
                
                
                
                Button(action: {
                    guard let image = selectedUIImage else { return }
                    viewModel.signUp(fullname: fullname,
                                     username: username,
                                     email: email,
                                     password: password,
                                     profileImage: image)
                }, label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(Color(TWITTER_BLUE))
                        .frame(width: 400, height: 50)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .padding()
                })
                
                Spacer()
                
                Button(action: {
                    mode.wrappedValue.dismiss()
                }, label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 16))
                        Text("Sign In")
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

// MARK: - Preview

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
