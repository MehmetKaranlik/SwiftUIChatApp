//
//  UsernameExtension.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 27.01.2022.
//

import Foundation


extension String {
 func userNameExtract() -> String {
  if self.contains("@") {
   let range = self.range(of: "@")?.lowerBound
   let formattedString = String(self.prefix(upTo: range!))
   return formattedString
  }else{
   return ""
  }
 }
}
