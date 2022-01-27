//
//  UserSelectingViewModel.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 26.01.2022.
//

import Foundation
import UIKit
import SwiftUI
import FirebaseFirestore
import Firebase


class UserSelectingViewModel : ObservableObject {

 let service : UserSelectService

 @Published var users: [ChatUser]?
 @Published var isNavigatingToMessageView : Bool = false


 init() {
  service = UserSelectService()
  getAllUsers()
 }




 private func getAllUsers() {
  service.fetchAllUsers { data in
   self.users = data
   print(self.users?.count ?? 99)
  }
 }


}



