//
//  CustomSnackBar.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 27.01.2022.
//

import SwiftUI
import Foundation

struct CustomSnackBar: View {
 @Binding var isPresented : Bool
 let snackBarText: String
 let data : BannerData
 let level : BannerData.Level
 let function : () -> Void


    var body: some View {
     ZStack {
      level.tintColor
      HStack {
       Text(snackBarText)
      }
     }
     .frame(width: 250, height: isPresented ? 60 : 0, alignment: .center)
     .cornerRadius(10)
     .shadow(color: .black.opacity(0.6), radius: 5, x: 5, y: 5)
     .opacity(isPresented ?  1  : 0.5)
     .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
       withAnimation(.easeInOut(duration: 1)) {
        self.function()
       }
      }
     }
    }

}

struct CustomSnackBar_Previews: PreviewProvider {
    static var previews: some View {
     CustomSnackBar(isPresented: .constant(true), snackBarText: "Error", data: BannerData(title: "Help"), level: .warning, function: {

     })
      .previewLayout(.sizeThatFits)
      .padding()
    }
}



struct BannerData {
 let title: String
 var actionTitle: String? = nil
  // Level to drive tint colors and importance of the banner.
 var level: Level = .warning

 enum Level {
  case warning
  case success

  var tintColor: Color {
   switch self {
    case .warning: return .red.opacity(0.95)
    case .success: return .green.opacity(0.6)
   }
  }
 }
}
