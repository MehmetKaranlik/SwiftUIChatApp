//
//  AuthViewService.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 21.01.2022.
//

import Foundation
import UIKit
import Firebase


struct AuthViewService : AuthViewProtocol {

 static let shared = AuthViewService()

 private init() {}



 //creatin new account with validation
 func createNewAccount(email: String, password: String, passwordConfirm: String, image: UIImage?) {
  if AuthValidator.shared.createAccountValidator(
   email: email, password: password, passConfirm: passwordConfirm) {
   Auth.auth().createUser(withEmail: email, password: password) { result, err in
    if let error = err {
     print("Failed to create user : \(error)")
    }else {
     print("Successfully created user : \(result?.user.uid ?? "")")
     guard let uuid : String = result?.user.uid else {return}
     persistImageToStorage(uuid: uuid, image: image)
    }
   }
  }else {
   print("Not validated to create account")
  }
 }

 // MARK:  uploading imageData to storage
 func persistImageToStorage(uuid: String, image: UIImage?) {
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
    }
   }
  }
 }

  //signing in with validation
 func loginUser(email : String , password : String) {
  if AuthValidator.shared.loginValidator(email: email, password: password) {
   Auth.auth().signIn(withEmail: email, password: password) { result, error in
    if let error = error {
     print("Failed to login : \(error)")
    }else {
     print("Succesfully logged in : \(result?.user.uid ?? "")")
    }
   }
  }else {
   print("Not validated to login")
  }
 }


}
