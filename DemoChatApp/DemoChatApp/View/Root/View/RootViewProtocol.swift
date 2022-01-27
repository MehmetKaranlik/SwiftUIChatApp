//
//  RootView.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 27.01.2022.
//

import SwiftUI

public protocol RootViewProtocol: View {
 // MARK:  root properties
 var appState : AppState {get}
 init()
}



