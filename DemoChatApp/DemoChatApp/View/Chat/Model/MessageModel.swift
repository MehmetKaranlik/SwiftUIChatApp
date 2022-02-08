//
//  MessageModel.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 8.02.2022.
//

import Foundation
import Firebase


struct Message : Hashable {
 let text,time : String

 init(data : [String : Any]) {
  let tempTimeStamp = data[FirebaseKeys.timestamp] as! Timestamp
  self.time = tempTimeStamp.description
  self.text = data[FirebaseKeys.text] as! String
 }

}
