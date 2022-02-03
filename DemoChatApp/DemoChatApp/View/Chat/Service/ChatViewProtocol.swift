//
//  ChatViewProtocol.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 4.02.2022.
//

import Foundation

protocol ChatViewProtocol {

 func sendMessage(fromID: String , toID: String , messageData : [String: Any])

}
