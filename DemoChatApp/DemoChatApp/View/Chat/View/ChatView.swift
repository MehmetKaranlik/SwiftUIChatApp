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
        Text(userName+" "+userImageUrl)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(userName: "Eddie", userImageUrl: "")
    }
}
