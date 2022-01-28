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
 @ObservedObject var viewModel : ChatViewModel = ChatViewModel()
 @ObservedObject var appState : NavigationController = NavigationController.shared





 var body: some View {
  VStack {

   buildNavigationBar()
   ScrollView(showsIndicators: false) {

     ForEach(0...9, id : \.self) { index in
      HStack(alignment:.center) {
       if index%2 == 0 {
        Spacer(minLength: 50)
       }
       HStack(alignment: .center) {
        Text(
"""
Fake message
"""
        )
         .font(.system(size:11))
         .foregroundColor(.white)
       }
       .multilineTextAlignment(index.isMultiple(of: 2) ?.trailing : .leading)
       .frame(minHeight: 30)
       .padding(.vertical,7)
       .padding(.horizontal,10)
       .background(index.isMultiple(of: 2) ?  Color.green : Color.mint)
       .cornerRadius(12)
       .shadow(color: .black.opacity(0.3), radius: 5, y: 5)

       if index%2 != 0 {
        Spacer(minLength: 50)
       }

      }


      .padding(.vertical, 5)
     }
     .padding(.horizontal,5)

   }
  }

 }

 fileprivate func buildNavigationBar() -> ChatViewNavigationBar {
  return ChatViewNavigationBar(userImageUrl: self.userImageUrl, userName: self.userName) {
   appState.appState = .Home
  }
 }

}

struct ChatView_Previews: PreviewProvider {
 static var previews: some View {
  ChatView(userName: "fake@gmail.com", userImageUrl: "")
 }
}
