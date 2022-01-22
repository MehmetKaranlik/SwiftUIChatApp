//
//  HomeView.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 22.01.2022.
//

import SwiftUI

struct HomeView: View {
 // MARK:  properties



 // MARK:  body
    var body: some View {
     NavigationView {
      ScrollView {
       List {
        ForEach(0..<9, id: \.self) {
         Text("\($0)")
          .foregroundColor(.blue)
        }
       }
       .listStyle(.plain)
      }
      .navigationBarModifiers()


     }
    }
}

// MARK:  preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}




// MARK:  extensions
fileprivate extension ScrollView  {
 func navigationBarModifiers() -> some View {
  self
   .navigationTitle("Messages")
   .navigationBarTitleDisplayMode(.automatic)
 }
}
