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

       DynamicHorizontalSpacer(size: 50)
       Text(userName)
        .textModifier()
       Spacer()
       AsyncCircularAvatarView(userImageUrl: .constant(userImageUrl), radius: 50)
       


      }
      Divider()
       
     }

    }
}

struct ChatViewNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
     ChatViewNavigationBar(userImageUrl: "", userName: "Eddie" ,function: {
      print("123")
     })
      .previewLayout(.sizeThatFits)
      .padding()
    }
}


fileprivate extension Text {
 func textModifier() -> some View {
  self
   .font(.title2)
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
