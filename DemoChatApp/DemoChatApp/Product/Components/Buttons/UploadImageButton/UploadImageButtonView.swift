 //
 //  UploadImageButtonView.swift
 //  DemoChatApp
 //
 //  Created by mehmet karanlık on 21.01.2022.
 //

import SwiftUI
import UIKit

struct UploadImageButtonView: View {
 @Binding var image : UIImage?
 @Binding var isLogin : Bool
 @Binding var isAppear : Bool
 var size : CGFloat
 let function : () -> Void
 var body: some View {
  ZStack {
   Circle()
    .circleModifier(size: self.size)
    .scaleEffect(isLogin ? isAppear ? 1 : 1.2 : isAppear ? 0.8 : 1 )
   Button {
    if !isLogin {
     self.function()
    }
   } label: {
    if isLogin {
     Image(systemName: "message.circle.fill")
      .imageModifier(size: self.size)
      .scaleEffect(isAppear ? 1 : 1 )
      .disabled(isLogin ? true : false)
    }else {
     if let image = self.image {
      Image(uiImage: image)
       .imageModifier(size: self.size)
     }else {
      Image(systemName: "photo.circle.fill")
       .imageModifier(size: self.size)
       .scaleEffect(isAppear ? 1 : 1 )
       .disabled(isLogin ? true : false)
     }

    }




   }
   .buttonStyle(CustomUploadButtonStyle(isLogin: $isLogin))

  }

 }
}

struct UploadImageButtonView_Previews: PreviewProvider {
 static var previews: some View {
  UploadImageButtonView(image: .constant(nil), isLogin: .constant(false), isAppear: .constant(false), size: 50) {
   print("123")
  }
 }
}


fileprivate extension Circle {
 func circleModifier(size: CGFloat) -> some View {
  self
   .stroke(lineWidth: 2)
   .frame(width: size, height: size, alignment: .center)
   .foregroundColor(.green)
   .blur(radius: UIConstants.blurRadius)
 }
}


fileprivate extension Image {
 func imageModifier(size: CGFloat) -> some View {
  self
   .resizable()
   .scaledToFill()
   .frame(width: size-10, height:  size-10, alignment: .center)
   .foregroundColor(.green)
   .blur(radius: UIConstants.blurRadius)
   .clipShape(Circle())
 }
}

struct CustomUploadButtonStyle: ButtonStyle {
 @Binding var isLogin: Bool
 func makeBody(configuration: Configuration) -> some View {
  configuration.label
   .opacity(isLogin ? configuration.isPressed ? 1 : 1   : configuration.isPressed ? 0.8 : 1)
 }
}
