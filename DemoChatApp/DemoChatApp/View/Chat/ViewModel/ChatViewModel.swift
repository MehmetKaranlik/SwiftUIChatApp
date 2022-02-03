 //
 //  ChatViewModel.swift
 //  DemoChatApp
 //
 //  Created by mehmet karanlık on 27.01.2022.
 //

import Foundation
import Firebase

class ChatViewModel : ObservableObject {

 var fromId : String = ""
 var toId : String = ""
 let chatUser : ChatUser?

 let auth : Auth
 let service : ChatViewService

 init(chatUser: ChatUser){
  service = ChatViewService()
  auth = Firebase.Auth.auth()
  self.chatUser = chatUser
  findUserConditions()
 }

  // MARK:  Variables

  // bool
 @Published var isNavigatingHomeView : Bool = false


  //string
 @Published var messageText : String = ""


 // MARK:  Functions
 func submitMessage() {
  let messageData : [String : Any] = ["fromId" : self.fromId , "toId" : self.toId , "text" : messageText , "timestamp" : Timestamp()]
  service.sendMessage(fromID: self.fromId, toID: self.toId, messageData: messageData)
  print("message sended")
  messageText.removeAll()
 }

 func findUserConditions() {
  self.fromId = self.auth.currentUser?.uid  ?? ""
  self.toId = chatUser!.uid
 }
}
