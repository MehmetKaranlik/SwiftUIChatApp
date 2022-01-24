 //
 //  AuthView.swift
 //  DemoChatApp
 //
 //  Created by mehmet karanlık on 21.01.2022.
 //

import SwiftUI

struct AuthView: View {
  // MARK:  properties
 @ObservedObject var viewModel : AuthViewModel = AuthViewModel()




  // MARK:  body


 var body: some View {
  NavigationView {
   VStack(spacing:0) {
    if viewModel.isLoading {
     LoadingAnimationView(fileName: "avatarLoading")
    }else {
     NavigationBarView(isLogin: $viewModel.isLogin)

     CustomSegmentedPicker(isLogin: $viewModel.isLogin)


     DynamicVerticalSpacer(size: 40)

     UploadImageButtonView(image: $viewModel.image, isLogin: $viewModel.isLogin, isAppear: $viewModel.isAppear,size: 150) {
      viewModel.isPresented.toggle()
     }

     if !viewModel.isLogin {
      DynamicVerticalSpacer(size: 20)
      buildUploadPhotoTitle()
     }
     DynamicVerticalSpacer(size:viewModel.isLogin ? 80 : 40)

     UnobscuredTextFieldView(textBinding: $viewModel.email, promptText: "E-mail")

     DynamicVerticalSpacer(size: 10)

     ObscuredTextField(bindingText: $viewModel.password, promptText: "Password", labelText: "Password")


     buildBottomVstack()
    }
// MARK:  Vstack Expand



   }
   .animationModifier(viewModel: viewModel)
   .navigationBarHidden(true)
   
  }
  .navigationViewModifier()
  .fullScreenCover(isPresented: $viewModel.isPresented, onDismiss:{}) {
   ImagePicker(image: $viewModel.image)
  }




 }// MARK:  body


 fileprivate func buildBottomVstack() -> some View {
  return VStack{
   if !viewModel.isLogin {

    DynamicVerticalSpacer(size: 10)
    ObscuredTextField(bindingText: $viewModel.passwordConfirm, promptText: "Password Confirm", labelText: "Password Confirm")
   }
   Spacer()
   RoundedRectangleButton(width: 200, height: 40, foregroundColor: .white, backgroundColor: .green, opacity: 1, shadowApplied: true, buttonTitle:  viewModel.isLogin ? "Login": "Register") {
    buildAuthCallBack()
   }
   .padding(.top, viewModel.isLogin ? 50 : 0)
   Spacer()
   NavigationLink("", isActive: $viewModel.isNavigating) {
    HomeView()
     .navigationBarBackButtonHidden(true)
   }
  }
 }

 

 fileprivate func buildAuthCallBack()  {
  if !viewModel.isLogin {
   viewModel.createAccount()
  }else {
   viewModel.loginUser()
  }
 }


 fileprivate func buildUploadPhotoTitle() -> Text {

  return Text(viewModel.image != nil ? "To change photo, click photo above": "To upload a photo, click icon above")
    .foregroundColor(.green)
    .font(.body)
    .bold()
  }
 }




 // MARK:  preview
struct AuthView_Previews: PreviewProvider {
 static var previews: some View {
  AuthView()
 }
}


fileprivate extension VStack {
 func animationModifier(viewModel : AuthViewModel) -> some View {
  self
   .onChange(of: viewModel.isLogin) { newValue in

    if newValue == false {
     viewModel.isAppear = false
     withAnimation(.easeInOut(duration: 1.5).repeatForever()) {
      viewModel.isAppear = true
     }} else {
      viewModel.isAppear = false
      withAnimation(.easeInOut(duration: 1.5)) {
       viewModel.isAppear = true
      }}

    viewModel.clearCredentials()
   }
 }
}


fileprivate extension NavigationView {
 func navigationViewModifier() -> some View {
  self
   .navigationViewStyle(StackNavigationViewStyle())

 }
}
