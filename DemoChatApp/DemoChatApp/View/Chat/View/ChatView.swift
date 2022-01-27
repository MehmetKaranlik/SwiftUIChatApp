//
//  ChatView.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 27.01.2022.
//

import SwiftUI

struct ChatView: View {
 let userName : String
 let userImageUrl : String

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(userName: "Eddie", userImageUrl: "")
    }
}
