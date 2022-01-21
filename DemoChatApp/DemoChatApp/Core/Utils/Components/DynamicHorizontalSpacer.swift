//
//  DynamicHorizontalSpacer.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 21.01.2022.
//

import SwiftUI

struct DynamicHorizontalSpacer: View {
 let size : CGFloat?
 var body: some View {
  Spacer()
   .frame(width: size ?? 20, height: 0, alignment: .center)
 }
}

struct DynamicHorizontalSpacer_Previews: PreviewProvider {
    static var previews: some View {
        DynamicHorizontalSpacer(size: nil)
    }
}
