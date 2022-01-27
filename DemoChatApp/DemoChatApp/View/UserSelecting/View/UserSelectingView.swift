 //
 //  UserSelectingView.swift
 //  DemoChatApp
 //
 //  Created by mehmet karanlık on 26.01.2022.
 //

import SwiftUI

struct UserSelectingView: View {
 @Environment(\.presentationMode) var presentationMode
 @ObservedObject var viewModel : UserSelectingViewModel = UserSelectingViewModel()

 var body: some View {
  VStack {
   if viewModel.users != nil && viewModel.users!.count > 0  {
    buildUsers()
     .padding(.vertical,5)
   } else {
    LoadingAnimationView(fileName: "avatarLoading") // loading animation while waiting fetching process
     .frame(width: 250, height: 250, alignment: .center)
   }
  }
 }

 fileprivate func buildUsers() -> some View {
  return NavigationView {
   VStack(alignment:.leading) {
    buildNavigationBar()
     .padding(.horizontal, 10)
    DynamicVerticalSpacer(size: 10)
    ForEach(viewModel.users!, id: \.self) { item in
     builNavigationTile(item)
    }
    Spacer()
   }
   .hideBarAndNavigate() // extension to destroy navigation bar
  }
 }
 fileprivate func buildNavigationBar() -> UserSelectingNavigationBarView {
  return UserSelectingNavigationBarView(titleText: "New Message") {
   presentationMode.wrappedValue.dismiss() // cover closing function
  }

 }
 fileprivate func builNavigationTile(_ item: ChatUser) -> some View {
  return NavigationLink(isActive: $viewModel.isNavigatingToMessageView) {
   ChatView(userName: item.userName, userImageUrl: item.userProfileUrl) // destination
    .hideBarAndNavigate()

  } label: {
   MessagePreviewTile(userImageUrl: .constant(item.userProfileUrl), userName: item.userName, tileText: "User Desc", receiveData: nil) // label

  }
  .onTapGesture {

   viewModel.isNavigatingToMessageView.toggle()

  }
 }


}

struct UserSelectingView_Previews: PreviewProvider {
 static var previews: some View {
  UserSelectingView()
 }

}
