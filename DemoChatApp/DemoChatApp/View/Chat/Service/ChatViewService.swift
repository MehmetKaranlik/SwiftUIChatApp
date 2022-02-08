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


 // MARK:  Functions

 //message sending
 func sendMessage(fromID: String, toID: String, messageData: [String : Any]) {
   // saving message in perspective of current user
  let document = firestore
   .collection(FirebaseKeys.messages)
   .document(fromID)
   .collection(toID)
   .document()
  document.setData(messageData) { error in
    // error callback
   if let err = error {
    print("Couldnt save message to current user \(err)")
   }
  }
   // saving message to corresponding user aka toID
  let counterDocument = firestore
   .collection(FirebaseKeys.messages)
   .document(toID)
   .collection(fromID)
   .document()
  counterDocument.setData(messageData) { error in
   if let err = error {
    print("Couldnt save message to counter  \(err)")
   }
  }
 }


 //message fetching
 func fetchMessages(toID: String, chatUser: ChatUser, completionHandler: @escaping FetchMessagesHandler) {
  guard let fromID = auth.currentUser?.uid else {return}
  firestore
   .collection(FirebaseKeys.messages)
   .document(fromID)
   .collection(toID)
   .addSnapshotListener { querySnapshot, error in
    if let err = error {
     print("Something went wrong with listener \(err)")
    }
    else {
      // defining temp list to append later
     var temp : [Message]?
      // listened snapshot appended to temp list
     querySnapshot?.documents.forEach({ queryDocumentSnapshot in
      let data = queryDocumentSnapshot.data()
      temp?.append(Message.init(data: data))
     })
      // returning list of messages
     completionHandler(temp ?? [])
    }
   }
 }


}
