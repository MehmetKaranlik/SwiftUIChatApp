//
//  AuthView.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 21.01.2022.
//

import SwiftUI

struct AuthView: View {
 // MARK:  properties
 @ObservedObject var viewModel : AuthViewModel = AuthViewModel()


 // MARK:  body
    var body: some View {
     NavigationView {
      VStack(spacing:0) {
       NavigationBarView(isLogin: $viewModel.isLogin)
       CustomSegmentedPicker(isLogin: $viewModel.isLogin)
       Spacer()
      }
      .navigationBarHidden(true)
     }

    }
}



// MARK:  preview
struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
