//
//  CustomMessageInputView.swift
//  twitterclone
//
//  Created by ed on 02/05/2021.
//

import SwiftUI

struct CustomMessageInputView: View {
    
    @Binding var messageText: String
    
    var body: some View {
        HStack {
            TextField("Message...", text: $messageText)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("send")
            })
        }
    }
}

struct CustomMessageInputView_Previews: PreviewProvider {
    static var previews: some View {
        CustomMessageInputView(messageText: .constant("Message Text"))
            .previewLayout(.sizeThatFits)
    }
}
