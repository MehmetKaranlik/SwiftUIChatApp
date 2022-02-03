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
  // saving message in perspective of current user
  let document = firestore
   .collection("messages")
   .document(fromID)
   .collection(toID)
   .document()
  document.setData(messageData) { error in
   if let err = error {
    print("Couldnt save message to current user \(err)")
   }
  }
  // saving message to corresponding user aka toID
  let counterDocument = firestore
   .collection("messages")
   .document(toID)
   .collection(fromID)
   .document()
  counterDocument.setData(messageData) { error in
   if let err = error {
    print("Couldnt save message to counter  \(err)")
   }
  }
 }
}
