//
//  RootViewModel.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 27.01.2022.
//

import Foundation


class AppState : ObservableObject {

 init() {
  self.userFlow = defineRootView()
 }

 @Published var userFlow : UserFlow = .Auth


 enum UserFlow : CaseIterable {
  case Auth
  case Home
  case Chat
  case Setting
  case userSelecting
 }

 func defineRootView() -> UserFlow {
  if  LocaleManager.shared.getStringValue(key: LocaleKeys.email) != "" && LocaleManager.shared.getStringValue(key: LocaleKeys.userPassword) != "" {
   return .Home
  }else {
   return .Auth
  }

 }
}
