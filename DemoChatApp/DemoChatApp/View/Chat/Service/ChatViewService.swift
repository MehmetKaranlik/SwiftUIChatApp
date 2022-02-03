//
//  ChatViewService.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 4.02.2022.
//

import Foundation
import Firebase

struct ChatViewService : ChatViewProtocol {

 let auth : Auth
 let firestore : Firestore

 init() {
  auth = Auth.auth()
  firestore = Firestore.firestore()
 }

 func sendMessage(fromID: String, toID: String, messageData: [String : Any]) {
  let document = firestore
   .collection("messages")
   .document(fromID)
   .collection(toID)
   .document()

  document.setData(messageData) { error in
   if let err = error {
    print("Couldnt send message \(err)")
   }
  }
 }
}
