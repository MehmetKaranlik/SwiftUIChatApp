//
//  RoundedTextFieldModifier.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 21.01.2022.
//

import SwiftUI
import UIKit

struct RoundedTextFieldModifier: ViewModifier {
 func body(content: Content) -> some View {
  content
   .frame(width: 225, height: 30, alignment: .center)
   .foregroundColor(.black)
   .textFieldStyle(.plain)
   .padding(.horizontal)
   .padding(.vertical,5)

   .overlay(
    RoundedRectangle(cornerRadius: .infinity)
     .stroke(lineWidth: 3)
     .foregroundColor(.green)

   )
 }


}


