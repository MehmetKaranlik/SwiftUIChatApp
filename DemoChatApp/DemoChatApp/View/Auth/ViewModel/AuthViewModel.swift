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
 @Published var isLoading : Bool = false
 @Published  var isLogin : Bool = true
 @Published  var isAppear : Bool  = false
 @Published  var isPresented : Bool = false


 // textfield variables

 @Published var email : String = ""
 @Published var password : String = ""
 @Published var passwordConfirm : String = ""




 // MARK:  Functions

 // Firebase Callbacks
 func createAccount()   -> Void {
  self.isLoading = true
   service.createNewAccount(email: self.email, password: self.password, passwordConfirm: self.passwordConfirm, image: image, completionHandler: {
   self.isLoading = false
  })

 }

 func loginUser()  -> Void {
  self.isLoading = true
   service.loginUser(email: email, password: password) {
   self.isLoading = false
  }
 }






 // util functions

 func clearCredentials() {
  password.removeAll()
  email.removeAll()
  passwordConfirm.removeAll()
  image = nil
 }
 

}

