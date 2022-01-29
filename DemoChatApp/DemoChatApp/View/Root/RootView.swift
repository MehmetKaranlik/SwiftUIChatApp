//
//  RootView.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 27.01.2022.
//

import SwiftUI

struct RootView: View {
 @ObservedObject var appState : NavigationController

 init() {
  appState = NavigationController.shared
 }

    var body: some View {
     switch appState.appState! {
      case .Auth:
       AuthView()
      case .Home:
       HomeView()
      case .Settings:
       SettingsView()
     }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
