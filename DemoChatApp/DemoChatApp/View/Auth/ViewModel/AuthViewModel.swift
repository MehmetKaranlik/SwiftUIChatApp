 //
 //  AuthViewModel.swift
 //  DemoChatApp
 //
 //  Created by mehmet karanlık on 21.01.2022.
 //

import Foundation


class AuthViewModel : ObservableObject {
 // bools
 @Published  var isLogin : Bool = true
 @Published  var isAppear : Bool  = false



 // textfield variables


 @Published var email : String = ""
 @Published var password : String = ""
 @Published var passwordConfirm : String = ""

}
