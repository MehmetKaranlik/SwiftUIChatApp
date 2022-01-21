 //
 //  ObscuredTextField.swift
 //  DemoChatApp
 //
 //  Created by mehmet karanlık on 21.01.2022.
 //

import SwiftUI

struct ObscuredTextField: View {
 @Binding var bindingText :String
 let promptText : String
 let labelText : String

 var body: some View {
  SecureField(text: $bindingText, prompt: Text(promptText)) {
   Text(labelText)
  }
  .modifier(RoundedTextFieldModifier())
  .padding(.horizontal)
 }
}

struct ObscuredTextField_Previews: PreviewProvider {
 static var previews: some View {
  ObscuredTextField(bindingText: .constant("Ok"),promptText: "ok",labelText: "ok")
 }
}
