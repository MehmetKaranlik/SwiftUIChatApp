 //
 //  SettingsView.swift
 //  DemoChatApp
 //
 //  Created by mehmet karanlık on 24.01.2022.
 //

import SwiftUI
import Lottie
import AudioToolbox

struct SettingsView: View {
 // MARK:  properties
 @ObservedObject var viewModel : SettingsViewModel = SettingsViewModel()


 // MARK:  body






 var body: some View {

   VStack {
      Text("What  do you want to do ? ")
       .foregroundColor(.green)
       .font(.title2)
      buildImageGroup()
      DynamicVerticalSpacer(size: 20)
      buildUserInformation()
      buildApplicationInformation()
     // DynamicVerticalSpacer(size: 50)
    RoundedRectangleButton(width: 250, height: 50, foregroundColor: .white, backgroundColor: .red, opacity: 1, shadowApplied: true, buttonTitle: "Sign-Out") {
     viewModel.getUserLoggedOut()
     viewModel.isNavigate.toggle()
    }
    NavigationLink("", isActive: $viewModel.isNavigate) {
     AuthView()
      .navigationBarBackButtonHidden(true)
      .navigationBarHidden(true)
    }.isDetailLink(false)


      Spacer()



     }

     .font(.footnote)
     .padding()
     .navigationBarTitleDisplayMode(.inline)
     .fullScreenCover(isPresented: $viewModel.isPresented, onDismiss: viewModel.updateUserPhoto) {
      ImagePicker(image: $viewModel.image)
    }


   }

 fileprivate func buildApplicationInformation() -> some View {
  return GroupBox {
   GroupListTile(leftText: "Application Name:", rightText: "SwiftUI Demo ChatApp")
   GroupListTile(leftText: "Developer:", rightText: "Mehmet Karanlik")


  } label: {
   Text("Application Information")
  }
  .padding()
 }


 fileprivate func buildUserInformation() -> some View {
  return GroupBox {
   GroupListTile(leftText: "Username:", rightText: viewModel.locale.getStringValue(key: LocaleKeys.username))
   GroupListTile(leftText: "Email:", rightText: viewModel.locale.getStringValue(key: LocaleKeys.email))
   GroupListTile(leftText: "Unique ID:", rightText: viewModel.locale.getStringValue(key: LocaleKeys.userUid))
  } label: {
   Text("User information")
  }
  .padding()
 }


fileprivate func buildImageGroup() -> some View {
  return GroupBox {
   buildImage()
   DynamicVerticalSpacer(size: 20)
   Text("To change image use icon above")
    .font(.caption)
    .foregroundColor(.green)
    .blur(radius: UIConstants.blurRadius)
  } label: {
   Text("Image")
  }
  .padding()
 }

 fileprivate func buildImage() -> some View {
  return ZStack(alignment: .bottomTrailing) {
   if viewModel.image == nil {
    AsyncCircularAvatarView(userImageUrl:"https://picsum.photos/200", radius: 150)
   }else{
    UploadImageButtonView(image: $viewModel.image, isLogin: .constant(false), isAppear: .constant(false),size: 150) {
     
    }
   }
   SimpleUploadButtonView(size: 55) {
    viewModel.isPresented.toggle()
   }

  }
 }

}



struct SettingsView_Previews: PreviewProvider {
 static var previews: some View {
  SettingsView()
 }
}

struct GroupListTile: View {
 let leftText : String
 let rightText : String
 var body: some View {
  HStack {Text(leftText);
   Spacer();
   Text(rightText)
  }
 }
}
