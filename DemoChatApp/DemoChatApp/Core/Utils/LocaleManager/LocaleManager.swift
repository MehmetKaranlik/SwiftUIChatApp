//
//  LocaleManager.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 22.01.2022.
//

import Foundation
import SwiftUI


struct LocaleManager {
 let defaults : UserDefaults
static let shared : LocaleManager = LocaleManager()
 private init() {
  defaults = UserDefaults.standard
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
  let temp : String = defaults.string(forKey: key.key)!
  return temp
 }

 func getIntValue(key : LocaleKeys) -> Int {
  let temp : Int = defaults.integer(forKey: key.key)
  return temp
 }

 func getBoolValue(key : LocaleKeys) -> Bool {
  let temp : Bool = defaults.bool(forKey: key.key)
  return temp
 }

}





