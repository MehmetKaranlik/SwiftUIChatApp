//
//  ChatViewProtocol.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 4.02.2022.
//

import Foundation

protocol ChatViewProtocol {
 typealias FetchMessagesHandler = (_ data:[Message]) -> Void
 func sendMessage(fromID: String , toID: String , messageData : [String: Any])
 func fetchMessages(toID: String, chatUser : ChatUser, completionHandler : @escaping FetchMessagesHandler )

}
