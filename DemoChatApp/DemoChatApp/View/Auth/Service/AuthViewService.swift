//
//  AuthViewService.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 21.01.2022.
//

import Foundation
import UIKit
import FirebaseAuth


struct AuthViewService : AuthViewProtocol {

 static let shared = AuthViewService()

 private init() {}



 //creatin new account with validation
 func createNewAccount(email : String , password : String, passwordConfirm : String) {
  if AuthValidator.shared.createAccountValidator(
   email: email, password: password, passConfirm: passwordConfirm) {
   Auth.auth().createUser(withEmail: email, password: password) { result, err in
    if let error = err {
     print("Failed to create user : \(error)")
    }else {
     print("Successfully created user : \(result?.user.uid ?? "")")
    }
   }
  }else {
   print("Not validated to create account")
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
