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
 private let service : HomeViewService


 @Published var localeManager : LocaleManager



 init() {
  localeManager = LocaleManager.shared
  service = HomeViewService()
  self.user.userName = self.localeManager.getStringValue(key: LocaleKeys.username)
  service.getUserName { snapshot, error in
   guard let data = snapshot?.data() else {return}
   if let err = error {
    print(err)
   }else {
    let temp = data["email"] as? String ?? ""
    self.user.email = temp
    self.user.userImageUrl = data["userProfileImageUrl"] as? String ?? ""


   }

  }

 }


// MARK:  Variables

 // bools
 @Published var isSheetPresented : Bool = false






 // userInfo
 @Published var user : CurrentUserModel = CurrentUserModel(email: "", userImageUrl: "", userName: "")



 func getUserLogOut() -> Void {
  service.getUserLogout {
   self.localeManager.clearAllCaches()
  }

 }

}
