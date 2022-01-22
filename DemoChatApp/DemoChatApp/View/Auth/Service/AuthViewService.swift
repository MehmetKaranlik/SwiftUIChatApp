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
     print("Successfully created user : \(result?.user.uid ?? "")")
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

  let userData = ["email" : email, "password" : password , "uid" : uid, "userProfileImageUrl" : imageProfileUrl.absoluteString ]

  FirebaseFirestore.Firestore
   .firestore()
   .collection("users")
   .document(uid).setData(userData) { error in
    if let err = error {
     print("Cant push user credentails to firestore : \(err)")
    }
    print("Succesfully pushed user credentials to firestore")
   }
 }


 // MARK:  uploading imageData to storage
 func persistImageToStorage(uuid: String, image: UIImage?, email : String, password : String) {
  guard let imageData = image?.jpegData(compressionQuality: 1) else {return}
  let ref = Storage.storage().reference(withPath: uuid)
  ref.putData(imageData, metadata: nil) { metadata, error in
   if let err = error {
    print("Failed to push image to storage: \(err)")
   }
   ref.downloadURL { url, error in
    if let err = error {
     print("Failed to download image: \(err)")
    }else {
     print("Successfully stored image with url: \(url!.absoluteURL)")
     storeUserInformation(imageProfileUrl: url!, email: email, password: password)
    }
   }
  }
 }

  // MARK: signing in with validation
 func loginUser(email : String , password : String, completionHandler :@escaping CompletionHandler) {
  if AuthValidator.shared.loginValidator(email: email, password: password) {
   Auth.auth().signIn(withEmail: email, password: password) { result, error in
    if let error = error {
     print("Failed to login : \(error)")
     completionHandler()
    }else {
     print("Succesfully logged in : \(result?.user.uid ?? "")")
     LocaleManager.shared.setStringValue(key: LocaleKeys.userUid, value: result?.user.uid ?? "")
     LocaleManager.shared.setStringValue(key: LocaleKeys.userPassword, value: password)
     LocaleManager.shared.setStringValue(key: LocaleKeys.email, value: email)
     completionHandler()
    }
   }
  }else {
   print("Not validated to login")
  }
 }


}
