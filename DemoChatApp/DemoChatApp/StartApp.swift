//
//  DemoChatAppApp.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 21.01.2022.
//

import SwiftUI
import Firebase
@main
struct StartApp: App {

 func defineRootView() -> Bool {
  return
    LocaleManager.shared.getStringValue(key: LocaleKeys.email) != "" && LocaleManager.shared.getStringValue(key: LocaleKeys.userPassword) != ""
}

 init() {
  FirebaseApp.configure()
 }
    var body: some Scene {
        WindowGroup {
         if defineRootView() {
          HomeView()
         }else{
          AuthView()
         }
        }
    }
}
