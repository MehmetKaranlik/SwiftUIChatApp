//
//  AsyncCircularAvatar.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 22.01.2022.
//

import SwiftUI

struct AsyncCircularAvatarView: View {
 // MARK:  properties
 let userImageUrl : URL?




 // MARK:  body
 var body: some View {
  ZStack(alignment: .center) {
   Circle()
    .circleModifier()
     buildAsyncImageAndPlaceholder()
  }
}



 fileprivate func buildAsyncImageAndPlaceholder() -> some View {
  return AsyncImage(url: userImageUrl ?? URL(string: "https://i.picsum.photos/id/728/5000/5000.jpg?hmac=N_DBMtEroAZ7yHParJ7Iv4DdGWULTNUoCvJqPx_xqrc"))
  {
         phase in

   if phase.image != nil {
    let image = phase.image
    image!
     .imageModifier()
   } else {
    LoadingAnimationView(fileName: "avatarLoading" )
        .frame(width: 60, height: 60, alignment: .center)
   }
  }
  .clipShape(Circle())
 }

}// MARK:  end of view

struct AsyncCircularAvatar_Previews: PreviewProvider {
    static var previews: some View {
        AsyncCircularAvatarView(userImageUrl: nil)
    }
}


fileprivate extension Circle {
 func circleModifier() -> some View {
  self
   .stroke(lineWidth: 2)
   .frame(width: 60, height: 60, alignment: .center)
   .foregroundColor(.green)
   .blur(radius: UIConstants.blurRadius)
 }
}

fileprivate extension Image {
 func imageModifier() -> some View {
  self
   .resizable()
   .scaledToFill()
   .frame(width: 50, height: 50, alignment: .center)


 }
}
