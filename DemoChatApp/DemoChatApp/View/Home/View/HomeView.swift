 //
 //  HomeView.swift
 //  DemoChatApp
 //
 //  Created by mehmet karanlık on 22.01.2022.
 //

import SwiftUI

struct HomeView: View {
  // MARK:  properties
 @ObservedObject var viewModel : HomeViewModel
 @ObservedObject var appState : NavigationController
 let width : CGFloat = UIScreen.main.bounds.width
 let height : CGFloat = UIScreen.main.bounds.height


 init() {
  viewModel =  HomeViewModel()
  appState = NavigationController.shared
 }
 
 
  // MARK:  body
 var body: some View {
    ZStack(alignment:.bottom) {

    buildMessages(viewModel: self.viewModel)

     RoundedRectangleButton(width:  width * 0.8, height: 40, foregroundColor: .white, backgroundColor: .green, opacity: 1, shadowApplied: true, buttonTitle: "+ New Message") {
      appState.appState = .UserSelecting

     }
     .padding(.bottom ,20)
    }
   .navigationBarModifiers(vm: self.viewModel)


  .navigationViewStyle(StackNavigationViewStyle())

 }
 
 fileprivate func buildMessages(viewModel: HomeViewModel) ->  some View {
  return
   VStack {
    HomeViewNavigationBar(height: 55, userImageUrl: $viewModel.userImageUrl, imageSize: 45) {
     appState.appState = .Settings
    }
    ScrollView {
     VStack {
      ForEach(0...2, id : \.self) { item in
       MessagePreviewTile(userImageUrl: .constant(nil), userName: "Eddie", tileText: "Lorem ipsum", receiveData: Date.now)
      }

      DynamicVerticalSpacer(size: 70)
     }

    }
   }
   .refreshable {
   print("123")
   viewModel.refreshFunction()
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
fileprivate extension ZStack  {
 
 
 func navigationBarModifiers(vm : HomeViewModel) -> some View {
  self
   .navigationTitle("Messages")
   .navigationBarTitleDisplayMode(.automatic)
   .navigationBarHidden(true)
   .ignoresSafeArea(edges: .bottom)
 }
 
 
}
