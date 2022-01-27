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

 var body: some View {
  VStack {
   NavigationLink("", isActive: $viewModel.isNavigatingHomeView) {
    HomeView()
     .hideBarAndNavigate()
   }
   ChatViewNavigationBar(userImageUrl: self.userImageUrl, userName: self.userName) {
    viewModel.isNavigatingHomeView.toggle()
   }
   ScrollView {
    Text(userName+" "+userImageUrl)
   }
  }
  .padding(.horizontal,20)
  .padding(.vertical,5)
 }
}

struct ChatView_Previews: PreviewProvider {
 static var previews: some View {
  ChatView(userName: "Eddie Brook", userImageUrl: "")
 }
}
