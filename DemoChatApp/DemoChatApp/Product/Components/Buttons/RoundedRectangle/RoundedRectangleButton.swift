//
//  RoundedRectangleButton.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 21.01.2022.
//

import SwiftUI

struct RoundedRectangleButton: View {
 let width : CGFloat
 let height : CGFloat
 let foregroundColor : Color?
 let backgroundColor : Color?
 let opacity : Double
 let shadowApplied : Bool
 let buttonTitle : String
 let function : () -> Void
    var body: some View {
     Button {
      self.function()
     } label: {
      Text(buttonTitle)
     }.buttonStyle(CustomButtonStyle(width: width, height: height, foregroundColor: foregroundColor, backgroundColor: backgroundColor, opacity: 1, shadowApplied: shadowApplied))

    }
}

struct RoundedRectangleButton_Previews: PreviewProvider {
    static var previews: some View {
     RoundedRectangleButton(width: 200, height: 50, foregroundColor: .white, backgroundColor: .green, opacity: 1, shadowApplied: true, buttonTitle: "Text", function: {print("123")})
      .previewLayout(.sizeThatFits)
      .padding()
    }
}



