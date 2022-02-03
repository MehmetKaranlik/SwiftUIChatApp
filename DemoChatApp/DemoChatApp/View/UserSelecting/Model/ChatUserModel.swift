 //
 //  ChatUserModel.swift
 //  DemoChatApp
 //
 //  Created by mehmet karanlık on 26.01.2022.
 //

import Foundation


struct ChatUser : Hashable , Identifiable {
 var id: UUID
 var userEmail : String
 var userName : String
 var userProfileUrl : String
 var uid : String

 init(email : String, userProfileUrl : String, uid : String) {
  self.userEmail = email
  self.userProfileUrl = userProfileUrl
  self.uid = uid
  userName = email.userNameExtract()
  id = UUID()
 }
}
