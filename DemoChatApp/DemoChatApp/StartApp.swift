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

 init() {
  FirebaseApp.configure()
 }
    var body: some Scene {
        WindowGroup {
         HomeView()
        }
    }
}
