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
 let width : CGFloat
 let height : CGFloat
 let foregroundColor : Color?
 let backgroundColor : Color?
 let opacity : Double
 let shadowApplied : Bool


 // MARK:  body
 func makeBody(configuration: Configuration) -> some View {
  configuration.label
   .foregroundColor(foregroundColor ?? .white)
   .frame(width:configuration.isPressed ? width*0.8: width, height: configuration.isPressed ? height*0.9 :height, alignment: .center)
   .background(backgroundColor ?? Color.green)
   .blur(radius: UIConstants.blurRadius)
   .clipShape(RoundedRectangle(cornerRadius: .infinity))
   .opacity(configuration.isPressed ? opacity*0.8 : opacity)
   .shadow(color: .black.opacity(shadowApplied ? 0.5 : 0), radius: shadowApplied ? 5 : 0, x: 0, y:  shadowApplied ? 10 : 0)
 }

}
