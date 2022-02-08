 //
 //  UserSelectService.swift
 //  DemoChatApp
 //
 //  Created by mehmet karanlık on 26.01.2022.
 //

import Foundation
import FirebaseFirestore




struct UserSelectService : UserSelectProtocol {
 var firestore: Firestore
 
 
 init() {
  firestore = FirebaseFirestore.Firestore.firestore()
 }
 
 
 func fetchAllUsers(completionHandler: @escaping FetchAllUsersCompletionHandler) {
  var temp = [ChatUser]()
  firestore.collection(FirebaseKeys.users).getDocuments { QuerySnapshot, error in
   if let error = error {
    print("Failed to fetch users from fires store : \(error)")
   }
   QuerySnapshot?.documents.forEach({ snapshot in
    guard let email = snapshot[FirebaseKeys.email] as? String else {return}
    temp.append(ChatUser(email: email, userProfileUrl: snapshot[FirebaseKeys.userProfileImageUrl] as! String, uid: snapshot[FirebaseKeys.uid] as! String))
    completionHandler(temp)
   }
                                    
   )}
 }
 
 
}
