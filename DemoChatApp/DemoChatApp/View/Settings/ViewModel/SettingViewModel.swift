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


 //image
 var image : UIImage?



 // functions


 func getUserLoggedOut() -> Void {
  service.getUserLogout {
   self.locale.clearAllCaches()
  }
 }

}
