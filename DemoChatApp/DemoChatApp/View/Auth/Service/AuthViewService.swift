 //
 //  AuthViewService.swift
 //  DemoChatApp
 //
 //  Created by mehmet karanlık on 21.01.2022.
 //

import Foundation
import UIKit
import Firebase
import FirebaseFirestore


typealias CompletionHandler =  () ->  Void
struct AuthViewService : AuthViewProtocol {

 static let shared = AuthViewService()
 
 private init() {}



  // MARK: creatin new account with validation
 func createNewAccount(email: String, password: String, passwordConfirm: String, image: UIImage?,  completionHandler : @escaping CompletionHandler) {

  if AuthValidator.shared.createAccountValidator(
   email: email, password: password, passConfirm: passwordConfirm) {
   Auth.auth().createUser(withEmail: email, password: password) { result, err in
    if let error = err {
     completionHandler()
     print("Failed to create user : \(error)")
    }else {
     guard let uuid : String = result?.user.uid else {return}
     persistImageToStorage(uuid: uuid, image: image, email: email,password: password)
     completionHandler()
    }
   }

  }else {
   print("Not validated to create account")
  }
 }


  // MARK:  store image to firestore
 private func storeUserInformation(imageProfileUrl : URL, email : String, password : String) -> Void {
  guard let uid = FirebaseAuth.Auth.auth().currentUser?.uid else { return }
  let userData = [FirebaseKeys.email : email, "password" : password , FirebaseKeys.uid : uid, FirebaseKeys.userProfileImageUrl : imageProfileUrl.absoluteString ]
  FirebaseFirestore.Firestore
   .firestore()
   .collection(FirebaseKeys.users)
   .document(uid).setData(userData) { error in
    if let err = error {
     print("Cant push user credentails to firestore : \(err)")
    }
   }
 }


  // MARK:  uploading imageData to storage
 func persistImageToStorage(uuid: String, image: UIImage?, email : String, password : String) {
  guard let imageData = image?.jpegData(compressionQuality: 0.50)
  else {return
   storeUserInformation(imageProfileUrl: URL(string: "https://toppng.com/uploads/preview/roger-berry-avatar-placeholder-11562991561rbrfzlng6h.png")!, email: email, password: password)}

  let ref = Storage.storage().reference(withPath: uuid)

  ref.putData(imageData, metadata: nil) { metadata, error in
   if let err = error {
    print("Failed to push image to storage: \(err)")
   }
   ref.downloadURL { url, error in
    if let err = error {
     print("Failed to download image: \(err)")
     storeUserInformation(imageProfileUrl: url != nil ?  url! :URL(string: "")!, email: email, password: password)
    }else {
     storeUserInformation(imageProfileUrl: url!, email: email, password: password)
    }
   }
  }
 }

  // MARK: signing in with validation
 func loginUser(email : String , password : String, completionHandler :@escaping CompletionHandler, errorHandler : @escaping CompletionHandler ) {
  if AuthValidator.shared.loginValidator(email: email, password: password) {
   Auth.auth().signIn(withEmail: email, password: password) { result, error in
    if let error = error {
     print("Failed to login : \(error)")
    }else {
     LocaleManager.shared.setStringValue(key: LocaleKeys.userUid, value: result?.user.uid ?? "")
     completionHandler()
    }
   }
  }else {
   print("Not validated to login")
   errorHandler()
  }
 }


}
