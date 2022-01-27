//
//  RootView.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 27.01.2022.
//

import SwiftUI

struct RootView : View {
 @ObservedObject var appState: AppState
 init() {
  appState = AppState()
 }
  var body: some View {
   if appState.userFlow == .Home {
      HomeView()
   }else if appState.userFlow == .Auth {
     AuthView()
   }else if appState.userFlow == .Setting {
    SettingsView()
   } else if appState.userFlow == .userSelecting {
    UserSelectingView()
   }

}

}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
