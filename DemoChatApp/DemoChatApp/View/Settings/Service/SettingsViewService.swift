//
//  SettingsViewService.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 24.01.2022.
//

import Foundation
import Firebase


struct SettingsViewService : SettingsViewProtocol {
 var auth: Auth

 init() {
  auth = Auth.auth()
 }


 
 func getUserLogout(completionHandler: @escaping CompletionHandler) {
  do {
   try auth.signOut()
  } catch  {}
  completionHandler()
 }
}
