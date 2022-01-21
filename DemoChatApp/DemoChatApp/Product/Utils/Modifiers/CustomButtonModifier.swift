//
//  CustomButtonModifier.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 21.01.2022.
//

import Foundation
import SwiftUI


struct CustomButtonStyle: ButtonStyle {
 // MARK:  properties

 // MARK:  body
 func makeBody(configuration: Configuration) -> some View {
  configuration.label
   .foregroundColor(.white)
   .frame(width:configuration.isPressed ? 180: 200, height: configuration.isPressed ? 45 :50, alignment: .center)
   .background(Color.green)
   .blur(radius: UIConstants.blurRadius)
   .clipShape(RoundedRectangle(cornerRadius: .infinity))
   .opacity(configuration.isPressed ? 0.8 : 1)
   .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 10)
 }

}
