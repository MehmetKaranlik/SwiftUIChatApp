//
//  MessagePreviewTile.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 22.01.2022.
//

import SwiftUI

struct MessagePreviewTile: View {
 // MARK:  properties

 @Binding var userImageUrl : String?
 let userName : String
 let tileText : String
 let receiveData : Date?



// MARK:  body


 var body: some View {

  VStack {
   buildTileBody()
   .padding(.horizontal, 5)
  }
  .background(Color.gray.opacity(0.02))
  .padding(.vertical,2)
    }



 fileprivate func buildTileBody() -> some View {
  return HStack(alignment:.top ,spacing:0) {
   DynamicHorizontalSpacer(size: 10)
   AsyncCircularAvatarView(userImageUrl: $userImageUrl, radius: 60)
   DynamicHorizontalSpacer(size: 20)
   VStack(alignment: .leading, spacing: 0) {
    buildUserInfo()
    DynamicVerticalSpacer(size: 5)
    buildMessageText()
   }
   Spacer(minLength: 60)

  }

 }


 fileprivate func buildMessageText() -> some View {
  return Text(tileText)
   .font(.subheadline)
   .lineLimit(1)
 }


 fileprivate func buildUserInfo() -> Text {
  return Text(userName)
   .font(.headline)
   .bold()
 }

}



// MARK:  preview
struct MessagePreviewTile_Previews: PreviewProvider {
    static var previews: some View {
     MessagePreviewTile(userImageUrl: .constant(nil), userName: "Eddie" ,tileText: "Lorem ipsum Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum" , receiveData: Date.now)
      .previewLayout(.sizeThatFits)

    }
}



