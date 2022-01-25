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
  self.user.userName = localeManager.getStringValue(key: LocaleKeys.username)
  service.getUserName { snapshot, error in
   guard let data = snapshot?.data() else {return}
   if let err = error {
    print(err)
   }else {
    self.user.email = data["email"] as? String ?? ""
    self.user.userImageUrl = data["userProfileImageUrl"] as? String ?? ""
    if  data["userImageUrl"] as? String != "" {
     let userImageUrl = data["userImageUrl"] as? String
     self.localeManager.setStringValue(key: LocaleKeys.imageUrl, value: userImageUrl ?? "")
     print("imageUrlCache:" + self.localeManager.getStringValue(key: LocaleKeys.imageUrl))
    }
    self.user.userImageUrl = self.localeManager.getStringValue(key: LocaleKeys.imageUrl)


   }

  }

 }


// MARK:  Variables

 // bools
 @Published var isSheetPresented : Bool = false






 // userInfo
 @Published var user : CurrentUserModel = CurrentUserModel(email: "", userImageUrl: nil, userName: "")



 

 }


