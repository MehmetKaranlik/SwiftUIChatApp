//
//  LocaleKeys.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 22.01.2022.
//

import Foundation


enum LocaleKeys : CaseIterable {
 case userUid
 case email
 case userPassword
 case username


 var key : String  {
  switch self {
   case .email : return "userName"
   case .userUid : return "userUid"
   case .userPassword : return "userPassword"
   case .username : return "username"
  }
 }
}
