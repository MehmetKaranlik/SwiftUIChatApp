//
//  UnobscuredTextFieldView.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 21.01.2022.
//

import SwiftUI

struct UnobscuredTextFieldView: View {
 @Binding var textBinding : String
 let promptText: String
    var body: some View {
     TextField(text: $textBinding, prompt: Text(promptText)) {
      Text("Email")
     }
     .modifier(RoundedTextFieldModifier())
     .padding(.horizontal)

    }

}

struct UnobscuredTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
     UnobscuredTextFieldView(textBinding: .constant("Ok"), promptText: "Placeholder")
      .previewLayout(.sizeThatFits)

    }
}


