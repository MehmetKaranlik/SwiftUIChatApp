//
//  ChatViewModel.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 27.01.2022.
//

import Foundation
import Firebase

class ChatViewModel : ObservableObject {

 let fromId : String = ""
 let toId : String = ""
 let chatUser : ChatUser?

 let auth : Auth
 let firestore : Firestore

 init?(chatUser: ChatUser){
  auth = Firebase.Auth.auth()
  firestore = Firestore.firestore()
  self.chatUser = chatUser
  guard  let fromId = self.auth.currentUser?.uid else {return nil}
 // guard  let toId = firestore.collection("users"). else {return}
 }

// MARK:  Variables

 // bool
 @Published var isNavigatingHomeView : Bool = false


 //string
 @Published var messageText : String = ""


 // MARK:  Functions

 func sendMessage() {
  print(self.messageText)
 }
}
