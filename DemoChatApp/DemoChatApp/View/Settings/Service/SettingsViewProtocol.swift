//
//  SettingsViewProtocol.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 24.01.2022.
//

import Foundation


protocol SettingsViewProtocol {
 typealias CompletionHandler =  () ->  Void


 func getUserLogout(completionHandler: @escaping CompletionHandler) -> Void
}
