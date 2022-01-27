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
 let appState : NavigationController

 init() {
  locale = LocaleManager.shared
  service  = SettingsViewService()
  userImageUrl = locale.getStringValue(key: LocaleKeys.imageUrl)
  appState = NavigationController.shared
 }

 // MARK:  variables
 //bools
 @Published var isPresented : Bool = false
 @Published var isNavigate : Bool = false

 //strings
 @Published var userImageUrl : String?
 


 //image
 var image : UIImage?



 // functions


 func getUserLoggedOut() -> Void {
  service.getUserLogout {
   self.locale.clearAllCaches()
   self.appState.appState = .Auth
  }
 }

 func updateUserPhoto() -> Void {
  service.persistImageToStorage(image: image) { urlString in
   self.locale.setStringValue(key: LocaleKeys.imageUrl, value: urlString)
   print("new url cached")
  }
 }

}
