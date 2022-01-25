//
//  SettingsViewProtocol.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 24.01.2022.
//

import Foundation
import Firebase
import UIKit


protocol SettingsViewProtocol {
 var auth: Firebase.Auth {
  get
 }
 
 init()

 typealias CompletionHandler =  () ->  Void
 typealias URLReturn = (String) -> Void


 func getUserLogout(completionHandler: @escaping CompletionHandler) -> Void
 func persistImageToStorage(image: UIImage?, urlReturn : @escaping URLReturn) -> Void
}
