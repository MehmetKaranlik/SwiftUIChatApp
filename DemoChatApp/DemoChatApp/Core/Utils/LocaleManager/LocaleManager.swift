//
//  LocaleManager.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 22.01.2022.
//

import Foundation
import SwiftUI


struct LocaleManager {

static let shared : LocaleManager = LocaleManager()
 private init() {

 }


 func clearAllCaches() -> Void {

 }



 // setters
 func setStringValue(key: LocaleKeys, value : String) -> Void {
  UserDefaults.standard.set(value, forKey: key.key)
 }

 func setIntValue(key: LocaleKeys, value : Int) -> Void {
  UserDefaults.standard.set(value, forKey: key.key)
 }

 func setBoolValue(key: LocaleKeys, value : Bool) -> Void {
  UserDefaults.standard.set(value, forKey: key.key)
 }




// getters
 func getStringValue(key : LocaleKeys) -> String {
  guard let temp : String = (UserDefaults.value(forKey: key.key) as? String)  else {return ""}
  return temp
 }

 func getIntValue(key : LocaleKeys) -> Int {
  guard let temp : Int = (UserDefaults.value(forKey: key.key) as? Int)  else {return 0}
  return temp
 }

 func getBoolValue(key : LocaleKeys) -> Bool {
  guard let temp : Bool = (UserDefaults.value(forKey: key.key) as? Bool)  else {return false}
  return temp
 }

}





