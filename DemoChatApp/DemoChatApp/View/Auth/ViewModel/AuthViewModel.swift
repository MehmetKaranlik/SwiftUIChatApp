 //
 //  AuthViewModel.swift
 //  DemoChatApp
 //
 //  Created by mehmet karanlık on 21.01.2022.
 //

import Foundation
import Firebase


class AuthViewModel : ObservableObject {
// MARK:  instances
 let service : AuthViewService


 init() {
  service = AuthViewService.shared
 }


  // bools

 @Published  var isLogin : Bool = true
 @Published  var isAppear : Bool  = false



 // textfield variables

 @Published var email : String = ""
 @Published var password : String = ""
 @Published var passwordConfirm : String = ""


 // Firebase Callbacks
 func createAccount() -> Void {
  service.createNewAccount(email: self.email, password: self.password, passwordConfirm: self.passwordConfirm)
 }

 func loginUser() -> Void {
  service.loginUser(email: self.email, password: self.password)
 }






 // util functions

 func clearCredentials() {
  password.removeAll()
  email.removeAll()
  passwordConfirm.removeAll()
 }
 

}

