//
//  NavigateExtensions.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 27.01.2022.
//

import Foundation
import SwiftUI

extension View {
 // to prevent secondary navigation bar bug
 func hideBarAndNavigate() -> some View {
  self
   .navigationBarHidden(true)
   .navigationBarBackButtonHidden(true)
 }
}
