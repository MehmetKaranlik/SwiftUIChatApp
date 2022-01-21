 //
 //  UploadImageButtonView.swift
 //  DemoChatApp
 //
 //  Created by mehmet karanlık on 21.01.2022.
 //

import SwiftUI

struct UploadImageButtonView: View {
 @Binding var isLogin : Bool
 @Binding var isAppear : Bool
 let function : () -> Void
 var body: some View {
  ZStack {
   Circle()
    .circleModifier()
    .scaleEffect(isLogin ? isAppear ? 1 : 1.2 : isAppear ? 0.8 : 1 )
   Button {
    if !isLogin {
     self.function()
    }
   } label: {
    Image(systemName: isLogin ? "message.circle.fill" :"photo.circle.fill")
     .imageModifier()
     .scaleEffect(isAppear ? 1 : 1 )
     .disabled(isLogin ? true : false)

   }
   .buttonStyle(CustomUploadButtonStyle(isLogin: $isLogin))

  }

 }
}

struct UploadImageButtonView_Previews: PreviewProvider {
 static var previews: some View {
  UploadImageButtonView(isLogin: .constant(true),isAppear: .constant(true), function: {print("123")})
 }
}


fileprivate extension Circle {
 func circleModifier() -> some View {
  self
   .stroke(lineWidth: 3)
   .frame(width: 120, height: 120, alignment: .center)
   .foregroundColor(.green)
   .blur(radius: UIConstants.blurRadius)
 }
}


fileprivate extension Image {
 func imageModifier() -> some View {
  self
   .resizable()
   .scaledToFit()
   .frame(width: 90, height: 90, alignment: .center)
   .foregroundColor(.green)
   .blur(radius: UIConstants.blurRadius)
 }
}

struct CustomUploadButtonStyle: ButtonStyle {
 @Binding var isLogin: Bool
 func makeBody(configuration: Configuration) -> some View {
  configuration.label
   .opacity(isLogin ? configuration.isPressed ? 1 : 1   : configuration.isPressed ? 0.8 : 1)
 }
}
