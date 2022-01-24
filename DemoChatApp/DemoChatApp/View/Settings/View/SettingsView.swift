 //
 //  SettingsView.swift
 //  DemoChatApp
 //
 //  Created by mehmet karanlık on 24.01.2022.
 //

import SwiftUI

struct SettingsView: View {
 // MARK:  properties
 @ObservedObject var viewModel : SettingsViewModel = SettingsViewModel()


 // MARK:  body
 var body: some View {

  VStack {
   Spacer()
   buildImage()
   DynamicVerticalSpacer(size: 50)
   Text("Hello")


   Spacer()
  }
  .fullScreenCover(isPresented: $viewModel.isPresented, onDismiss: nil) {
   ImagePicker(image: $viewModel.image)
  }

   }


 fileprivate func buildImage() -> some View {
  return ZStack(alignment: .bottomTrailing) {
   if viewModel.image == nil {
    AsyncCircularAvatarView(userImageUrl: URL(string: "https://picsum.photos/200"), radius: 150)
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
