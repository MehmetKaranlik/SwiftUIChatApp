//
//  HomeViewModel.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 22.01.2022.
//

import Foundation
import UIKit
import Firebase
import FirebaseFirestore


class HomeViewModel : ObservableObject {


 // MARK:  init function
 init() {
  localeManager = LocaleManager.shared
  service = HomeViewService()
  self.user.userName = localeManager.getStringValue(key: LocaleKeys.username)
  defineUser()


 }


// MARK:  Variables
 //instances
 @Published var localeManager : LocaleManager
 private let service : HomeViewService

 // bools
 @Published var isNavigatingToUserSelectView : Bool = false


 //String

 @Published var userImageUrl : String?





 // Models
 @Published var user : CurrentUserModel = CurrentUserModel(email: "", userImageUrl: nil, userName: "")



 
// functions
 func refreshFunction() -> Void {
  service.getUserName { snapshot, error in
  guard let data = snapshot?.data() else {return}
   if let err = error {
    print(err)
   }else {
    if  data["userImageUrl"] as? String != "" {
     let userImageUrl = data["userProfileImageUrl"] as? String
     self.localeManager.setStringValue(key: LocaleKeys.imageUrl, value: userImageUrl ?? "")
     self.userImageUrl =  self.localeManager.getStringValue(key: LocaleKeys.imageUrl)
    }}
  }
 }

 

 func defineUser() -> Void {
  service.getUserName { snapshot, error in
   guard let data = snapshot?.data() else {return}
   if let err = error {
    print(err)
   }else {
    self.user.email = data["email"] as? String ?? ""
    self.user.userImageUrl = data["userProfileImageUrl"] as? String ?? ""
    if  data["userImageUrl"] as? String != "" {
     let userImageUrl = data["userProfileImageUrl"] as? String
     self.localeManager.setStringValue(key: LocaleKeys.imageUrl, value: userImageUrl ?? "")
     self.userImageUrl =  self.localeManager.getStringValue(key: LocaleKeys.imageUrl)
    }
   }
  }
 }


}


