 //
 //  AuthValidator.swift
 //  DemoChatApp
 //
 //  Created by mehmet karanlık on 21.01.2022.
 //

import Foundation
import SwiftUI



struct AuthValidator {
 

 static let shared : AuthValidator = AuthValidator()
 private init() { }


 // MARK:  create account validator with password confirm option
  func createAccountValidator(email : String , password : String , passConfirm : String) -> Bool {
  var validateResult : Bool = false
   if email.contains(".com") && email.contains("@") && password == passConfirm && !email.isEmpty && !password.isEmpty && !passConfirm.isEmpty {
   validateResult = true
   return validateResult
  }else {
   return validateResult
  }


 }

 func loginValidator(email:String, password: String) -> Bool {
  var validateResult : Bool = false
  if email.contains(".com") && email.contains(".com") && !email.isEmpty && !password.isEmpty {
   validateResult = true
   return validateResult
  }else {
   return validateResult
  }
 }


}
