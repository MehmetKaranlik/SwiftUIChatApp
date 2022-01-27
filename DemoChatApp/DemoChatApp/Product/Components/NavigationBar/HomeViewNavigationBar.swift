//
//  HomeViewNavigationBar.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 25.01.2022.
//

import SwiftUI

struct HomeViewNavigationBar: View {
 let height : CGFloat?

 @Binding var userImageUrl : String?
 let imageSize : CGFloat
 let function : () -> Void
    var body: some View {

      HStack(alignment : .bottom) {
       AsyncCircularAvatarView(userImageUrl: $userImageUrl, radius: imageSize)
       Spacer()
       Text("Messages")
        .font(.title2)
        .bold()
        .foregroundColor(.green)
        .blur(radius: UIConstants.blurRadius)
       Spacer()
       Button {
        self.function()
       } label: {
        Image(systemName: "gear")
         .font(.system(size: 30, weight: .bold))
         .foregroundColor(.green)
         .blur(radius: UIConstants.blurRadius)
       }





      }
      .frame(height: height ?? 50 )
     .padding(.horizontal,20)
     }


   
    
}

struct HomeViewNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
     HomeViewNavigationBar(height:60,userImageUrl: .constant(nil),imageSize: 50) {
      
     }
    }
}
