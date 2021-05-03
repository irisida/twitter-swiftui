//
//  ChatBubbleShape.swift
//  twitterclone
//
//  Created by ed on 02/05/2021.
//

import SwiftUI

struct ChatBubbleShape: Shape {
    
    var isFromCurrentUser: Bool
    
    // Required to fulfil the Shape protocol.
    // Here we are determining which corners
    // are curved with the roundedRect.
    // Corners to be curved will depend on the
    // value of isFromCurrentUser to create
    // the speaker bubble direction indicator
    // on the bottomLeft or botomright.
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [.topLeft, .topRight, isFromCurrentUser ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 16, height: 16))
        
        return Path(path.cgPath)
    }
    
    
    
    
    
}

// No preview available for this component
//struct ChatBubbleShape_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatBubbleShape(isFromCurrentUser: false)
//    }
//}
