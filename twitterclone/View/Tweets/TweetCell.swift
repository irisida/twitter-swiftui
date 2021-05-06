//
//  TweetCell.swift
//  twitterclone
//
//  Created by ed on 02/05/2021.
//

import SwiftUI

struct TweetCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                Image("spiderman")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipped()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Text("Peter Parker")
                            .font(.system(size: 14, weight: .semibold))
                        
                        Text("@spidey •")
                            .foregroundColor(.gray)
                        Text("2w")
                            .foregroundColor(.gray)
                    }
                    
                    Text("This is some random text that is used to depict a typical tweet message. I can span multiple lines. ")
                    
                    HStack {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "bubble.left")
                                .font(.system(size: 16))
                                .frame(width: 32, height: 32)
                        })
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            Image(systemName: "arrow.2.squarepath")
                                .font(.system(size: 16))
                                .frame(width: 32, height: 32)
                        })
                        
                        Spacer()
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "heart")
                                .font(.system(size: 16))
                                .frame(width: 32, height: 32)
                        })
                        
                        Spacer()
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "bookmark")
                                .font(.system(size: 16))
                                .frame(width: 32, height: 32)
                        })
                    }
                    .padding(.top, 4)
                    .padding(.trailing, 32)
                    .foregroundColor(.gray)
                }
                
                
            }
            .padding(.vertical, 8)
            
            
            
            Divider()
        }
        .padding(.leading, 2)
    }
}

struct TweetCell_Previews: PreviewProvider {
    static var previews: some View {
        TweetCell()
            .previewLayout(.sizeThatFits)
    }
}
