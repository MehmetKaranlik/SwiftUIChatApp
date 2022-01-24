//
//  SettingsViewProtocol.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 24.01.2022.
//

import Foundation
import Firebase


protocol SettingsViewProtocol {
 var auth: Firebase.Auth {
  get
 }
 
 init()

 typealias CompletionHandler =  () ->  Void


 func getUserLogout(completionHandler: @escaping CompletionHandler) -> Void
}
