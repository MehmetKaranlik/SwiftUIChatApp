 //
 //  AuthViewModel.swift
 //  DemoChatApp
 //
 //  Created by mehmet karanlık on 21.01.2022.
 //

import Foundation
import Firebase
import UIKit


class AuthViewModel : ObservableObject {
// MARK:  instances
 let service : AuthViewService


 init() {
  service = AuthViewService.shared
 }




 // MARK:  Variables
 // image variable
 @Published var image : UIImage?


  // bools

 @Published  var isLogin : Bool = true
 @Published  var isAppear : Bool  = false
 @Published  var isPresented : Bool = false


 // textfield variables

 @Published var email : String = ""
 @Published var password : String = ""
 @Published var passwordConfirm : String = ""




 // MARK:  Functions

 // Firebase Callbacks
 func createAccount() -> Void {
  service.createNewAccount(email: self.email, password: self.password, passwordConfirm: self.passwordConfirm,image: self.image ?? nil)
 }

 func loginUser() -> Void {
  service.loginUser(email: self.email, password: self.password)
 }






 // util functions

 func clearCredentials() {
  password.removeAll()
  email.removeAll()
  passwordConfirm.removeAll()
  image = nil
 }
 

}

