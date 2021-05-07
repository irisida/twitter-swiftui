//
//  CustomLazyView.swift
//  twitterclone
//
//  Created by ed on 07/05/2021.
//

import SwiftUI

// load the content of a view ONLY when it
// comes into view/focus 

struct CustomLazyView<Content: View>: View {
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: some View {
        build()
    }
}
