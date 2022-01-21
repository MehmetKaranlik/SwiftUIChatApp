//
//  SwiftUIView.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 21.01.2022.
//

import SwiftUI

struct NavigationBarView: View {
 // MARK:  properties
 @Binding var isLogin: Bool



 // MARK:  body
    var body: some View {
     HStack {
      Text(isLogin ?"Login" : "Register")
       .textModifier()


      Spacer()
     }
     .padding(.horizontal)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
     NavigationBarView(isLogin: .constant(false))
      .previewLayout(.sizeThatFits)

    }
}


fileprivate extension Text {
 func textModifier() -> some View {
  self
   .font(.largeTitle)
   .bold()
   .foregroundColor(.green)
   .blur(radius: UIConstants.blurRadius)

 }
}
