//
//  SimpleUploadButtonView.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 24.01.2022.
//

import SwiftUI

struct SimpleUploadButtonView: View {
// MARK:  properties
 let size : CGFloat
 let function : () -> Void



 // MARK:  body


 var body: some View {
     Button {
      self.function()
     } label: {
      buildButtonBody()
     }
     .buttonStyle(SimpleButtonStyle(size: self.size))

    }


 fileprivate func buildButtonBody() -> some View {
  return ZStack(alignment: .center) {
   Circle()
    .circleModifier(size: self.size)

   Image(systemName: "photo.on.rectangle.angled")
    .font(.system(size: size*0.6))
    .foregroundColor(.white)

  }
 }

}

struct SimpleUploadButtonView_Previews: PreviewProvider {
    static var previews: some View {
     SimpleUploadButtonView(size: 50) {
      
     }
    }
}

struct SimpleButtonStyle: ButtonStyle {
 var size : CGFloat
 func makeBody(configuration: Configuration) -> some View {
  configuration.label
   .clipShape(Circle())
   .frame(width: configuration.isPressed ? size*0.9 : size, height:configuration.isPressed ? size*0.9: size, alignment: .center)
   .shadow(color: .black.opacity(0.5), radius: 5, x: 5, y: 5)

 }
}

fileprivate extension Circle {
 func circleModifier(size : CGFloat) -> some View {
   self

   .foregroundColor(.green)
   .blur(radius: UIConstants.blurRadius)
 }
}



