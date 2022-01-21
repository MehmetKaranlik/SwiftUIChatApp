//
//  CustomSegmentedPicker.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 21.01.2022.
//

import SwiftUI

struct CustomSegmentedPicker: View {
 @Binding var isLogin : Bool
    var body: some View {
     Picker(selection: $isLogin) {
      Text("Login").tag(true)
      Text("Register").tag(false)
     } label: {
      Text("")
     }
     .pickerStyle(.segmented)
     .padding()


    }
}

struct CustomSegmentedPicker_Previews: PreviewProvider {
    static var previews: some View {
     CustomSegmentedPicker(isLogin: .constant(true))
      .previewLayout(.sizeThatFits)
      
    }
}
