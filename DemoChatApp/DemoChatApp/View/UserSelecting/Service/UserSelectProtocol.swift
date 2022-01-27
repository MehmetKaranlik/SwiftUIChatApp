//
//  UserSelectProtocol.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 26.01.2022.
//

import Foundation
import FirebaseFirestore
protocol UserSelectProtocol {
 typealias FetchAllUsersCompletionHandler = (_ data:[ChatUser]) -> Void
 var firestore: Firestore { get } 
 init()
 func fetchAllUsers(completionHandler: @escaping FetchAllUsersCompletionHandler)


}
