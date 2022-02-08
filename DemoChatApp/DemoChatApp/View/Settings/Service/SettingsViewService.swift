//
//  SettingsViewService.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 24.01.2022.
//

import Foundation
import Firebase
import UIKit
import FirebaseFirestore


struct SettingsViewService : SettingsViewProtocol {
 var auth: Auth

 init() {
  auth = Auth.auth()
 }



 func persistImageToStorage(image: UIImage?, urlReturn: @escaping URLReturn) {
  guard let imageData = image?.jpegData(compressionQuality: 0.50) else {return}
  guard let uuid = auth.currentUser?.uid else {return}
  let ref = Storage.storage().reference(withPath: uuid)
  ref.putData(imageData, metadata: nil) { data, error in
   if let error = error {
    print("Couldnt push image to service : \(error)")
   }
   ref.downloadURL { url, error in
    if let err = error {
     print("Failed to download image: \(err)")
    }else {
      //   print("Successfully stored image with url: \(url!.absoluteURL)")
     let userImageData : [String:String] = [FirebaseKeys.userProfileImageUrl : url!.absoluteString]
     FirebaseFirestore.Firestore
      .firestore()
      .collection(FirebaseKeys.users)
      .document(uuid).setData(userImageData) { error in
       if let err = error {
        print("Cant push user credentails to firestore : \(err)")
       }
       print("new imageUploaded")
        urlReturn(url!.absoluteString)
      }

    }
   }
  }
 }
 
 func getUserLogout(completionHandler: @escaping CompletionHandler) {
  do {
   try auth.signOut()
  } catch  {}
  completionHandler()
 }
}
