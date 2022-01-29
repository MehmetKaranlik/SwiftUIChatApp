 //
 //  UserSelectingView.swift
 //  DemoChatApp
 //
 //  Created by mehmet karanlık on 26.01.2022.
 //

import SwiftUI

struct UserSelectingView: View {
 @ObservedObject var viewModel : UserSelectingViewModel = UserSelectingViewModel()
 @ObservedObject var appState : NavigationController

 init(){
  appState = NavigationController.shared
 }

 var body: some View {
   VStack {
     if viewModel.users != nil && viewModel.users!.count > 0  {
      buildUsers()
       .padding(.vertical,5)
     } else {
      LoadingAnimationView(fileName: "avatarLoading") // loading animation while waiting fetching process
       .frame(width: 250, height: 250, alignment: .center)
     }
   }.navigationBarTitleDisplayMode(.inline)
}




 fileprivate func buildUsers() -> some View {

  ScrollView {
   VStack(alignment:.leading) {
      DynamicVerticalSpacer(size: 10)
      ForEach(viewModel.users!, id: \.self) { item in
       builNavigationTile(item)
      }
      Spacer()
   }
  }
 }





 fileprivate func buildNavigationBar() -> UserSelectingNavigationBarView {
  return UserSelectingNavigationBarView(titleText: "New Message") {
   appState.appState = .Home
  }
 }

 
 fileprivate func builNavigationTile(_ item: ChatUser) -> some View {
  return NavigationLink(isActive: $viewModel.isNavigatingToMessageView) {
   ChatView(userName: item.userName, userImageUrl: item.userProfileUrl) // destination
  } label: {
   MessagePreviewTile(userImageUrl: .constant(item.userProfileUrl), userName: item.userName, tileText: "User Desc", receiveData: nil) // label
  }
 }
}

struct UserSelectingView_Previews: PreviewProvider {
 static var previews: some View {
  UserSelectingView()
 }

}
