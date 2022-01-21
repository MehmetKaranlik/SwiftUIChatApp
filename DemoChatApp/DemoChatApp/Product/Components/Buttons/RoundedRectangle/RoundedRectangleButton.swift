//
//  RoundedRectangleButton.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 21.01.2022.
//

import SwiftUI

struct RoundedRectangleButton: View {
 let buttonTitle : String
 let function : () -> Void
    var body: some View {
     Button {
      self.function()
     } label: {
      Text(buttonTitle)
     }.buttonStyle(CustomButtonStyle())

    }
}

struct RoundedRectangleButton_Previews: PreviewProvider {
    static var previews: some View {
     RoundedRectangleButton(buttonTitle: "Press",function: {print("123")})
      .previewLayout(.sizeThatFits)
      .padding()
    }
}



