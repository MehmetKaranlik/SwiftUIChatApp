//
//  NavigationController.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 27.01.2022.
//

import Foundation


class NavigationController : ObservableObject {
 static let shared = NavigationController()

 @Published var appState: NavigateStates?

 private init() {
  appState = defineInitState()
 }


 func defineInitState() -> NavigateStates {
  if LocaleManager.shared.getStringValue(key: LocaleKeys.email) != "" && LocaleManager.shared.getStringValue(key: LocaleKeys.userPassword) != "" {
   return .Home
  }else {
   return .Auth
  }
 }
}
