 //
 //  AuthViewModel.swift
 //  DemoChatApp
 //
 //  Created by mehmet karanlık on 21.01.2022.
 //

import Foundation
import Firebase


class AuthViewModel : ObservableObject {
 // bools

 @Published  var isLogin : Bool = true
 @Published  var isAppear : Bool  = false



 // textfield variables

 @Published var email : String = ""
 @Published var password : String = ""
 @Published var passwordConfirm : String = ""


 // Firebase Callbacks

 func createNewAccount() {
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

  func loginUser() {
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



 // util functions

 func clearCredentials() {
  viewModel.password.removeAll()
  viewModel.email.removeAll()
  viewModel.passwordConfirm.removeAll()
 }
 

}

