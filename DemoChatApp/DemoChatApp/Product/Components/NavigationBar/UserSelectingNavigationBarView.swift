//
//  UserSelectingNavigationBarView.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 26.01.2022.
//

import SwiftUI

struct UserSelectingNavigationBarView: View {
 let titleText : String
 let function : () -> Void

    var body: some View {
     HStack(alignment : .center) {
      Button {
       self.function()
      } label: {
       HStack(spacing:5) {
        Image(systemName: "arrowtriangle.backward.fill")
         .imageModifier()
        Text("Back")
         .textModifier()
       }
      }
      DynamicHorizontalSpacer(size: 50)
      Text(titleText)
       .titleTextModifier()




      Spacer()

     }

    }
   }


struct UserSelectingNavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
     UserSelectingNavigationBarView(titleText: "New Message") {
      print("123")

     }
     .previewLayout(.sizeThatFits)

    }
}

fileprivate extension Image {
 func imageModifier() -> some View {
  self
   .font(.system(size: 10))
   .blur(radius: UIConstants.blurRadius)

}
}


fileprivate extension Text {

  func textModifier() -> some View {
  self
   .font(.footnote)
   .bold()
   .foregroundColor(.green)
   .blur(radius: UIConstants.blurRadius)
 }

 func titleTextModifier() -> some View {
  self
   .font(.title)
   .foregroundColor(.green)
   .blur(radius: UIConstants.blurRadius)
   .shadow(color: .black.opacity(0.2), radius: 5, x: 5, y: 5)


 }

}
