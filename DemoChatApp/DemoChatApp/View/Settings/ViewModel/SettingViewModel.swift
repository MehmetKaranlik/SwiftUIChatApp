//
//  SettingViewModel.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 24.01.2022.
//

import Foundation
import UIKit


class SettingsViewModel : ObservableObject {

 let locale : LocaleManager
 let service : SettingsViewService

 init() {
  locale = LocaleManager.shared
  service  = SettingsViewService()
 }

 // MARK:  variables
 //bools
 @Published var isPresented : Bool = false
 @Published var isNavigate : Bool = false

 //strings

 


 //image
 var image : UIImage?



 // functions


 func getUserLoggedOut() -> Void {
  service.getUserLogout {
   self.locale.clearAllCaches()
  }
 }

 func updateUserPhoto() -> Void {
  service.persistImageToStorage(image: image) { urlString in
   self.locale.setStringValue(key: LocaleKeys.imageUrl, value: urlString)
   print("new url cached")
  }
 }

}
