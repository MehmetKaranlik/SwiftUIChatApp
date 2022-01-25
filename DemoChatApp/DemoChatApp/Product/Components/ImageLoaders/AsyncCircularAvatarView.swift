//
//  AsyncCircularAvatar.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 22.01.2022.
//

import SwiftUI

struct AsyncCircularAvatarView: View {
 // MARK:  properties
 let userImageUrl : String?
 let radius : CGFloat





 // MARK:  body
 var body: some View {
  ZStack(alignment: .center) {
   Circle()
    .circleModifier(radius: self.radius)
     buildAsyncImageAndPlaceholder()
  }
}



 fileprivate func buildAsyncImageAndPlaceholder() -> some View {
  return AsyncImage(url: URL(string:userImageUrl ?? "https://toppng.com/uploads/preview/roger-berry-avatar-placeholder-11562991561rbrfzlng6h.png"))
  {
         phase in

   if phase.image != nil {
    let image = phase.image
    image!
     .imageModifier(radius:self.radius)
   } else {
    LoadingAnimationView(fileName: "avatarLoading" )
        .frame(width: radius , height: radius, alignment: .center)
   }
  }
  .clipShape(Circle())
 }

}// MARK:  end of view

struct AsyncCircularAvatar_Previews: PreviewProvider {
    static var previews: some View {
        AsyncCircularAvatarView(userImageUrl: nil, radius: 150)
    }
}


fileprivate extension Circle {
 func circleModifier(radius:CGFloat) -> some View {
  self
   .stroke(lineWidth: 2)
   .frame(width: radius, height: radius, alignment: .center)
   .foregroundColor(.green)
   .blur(radius: UIConstants.blurRadius)
   .shadow(radius: 5)
 }
}

fileprivate extension Image {
 func imageModifier(radius : CGFloat) -> some View {
  self
   .resizable()
   .scaledToFill()
   .frame(width: radius-10, height: radius-10, alignment: .center)


 }
}
