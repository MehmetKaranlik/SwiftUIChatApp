//
//  ChatViewNavigationBar.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 27.01.2022.
//

import SwiftUI

struct ChatViewNavigationBar: View {
 let userImageUrl : String
 let userName : String
 let function : () -> Void
    var body: some View {
     VStack {
      HStack(alignment:.center){
       Spacer()
       Button {
        self.function()
       } label: {
        HStack(spacing:5) {
         Image(systemName: "arrowtriangle.backward.fill")
          .imageModifier()
         Text("Back")
          .buttonTextModifier()
        }
       }
       Spacer()
       DynamicHorizontalSpacer(size: 20)
       Text(userName)
        .textModifier()
       Spacer()
       DynamicHorizontalSpacer(size: 40)

       AsyncCircularAvatarView(userImageUrl: .constant(userImageUrl), radius: 50)



       Spacer()

      }
      Divider()
       
     }

    }
}

struct ChatViewNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
     ChatViewNavigationBar(userImageUrl: "", userName: "fake@gmail.com" ,function: {
      print("123")
     })
      .previewLayout(.sizeThatFits)
      .padding()
    }
}


fileprivate extension Text {
 func textModifier() -> some View {
  self
   .font(.title3)
   .foregroundColor(.green)
   .blur(radius: UIConstants.blurRadius)
 }
 func buttonTextModifier() -> some View {
  self
   .font(.system(size: 15))
 }
}

fileprivate extension Image {
 func imageModifier() -> some View {
  self
   .font(.system(size: 10))
   .blur(radius: UIConstants.blurRadius)
 }
}
