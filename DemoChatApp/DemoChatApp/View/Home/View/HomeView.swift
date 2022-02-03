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
 @State private var location: CGPoint



 init() {
  viewModel =  HomeViewModel()
  appState = NavigationController.shared
  location = CGPoint(x: (width - 30), y: height/2)
}

  // MARK:  body
 var body: some View {
  NavigationView {
   ZStack {
    buildMessages(viewModel: self.viewModel).tag(0)
    buildNewConversationButton()
    NavigationLink("", isActive: $viewModel.isNavigatingToUserSelectView) {
     UserSelectingView()
    }
   }
   .navigationBarModifiers(vm: self.viewModel)
   .ignoresSafeArea(edges: .bottom)
  }

 }
 fileprivate func buildNewConversationButton() -> some View {
   Image(systemName: "plus")
   .visualModifier()
   .position(self.location)
   .gesture(
    DragGesture()
     .onChanged({ value in

      self.location = value.location
     })
     .onEnded({ value in
      withAnimation {
       self.location.x = self.width - 30}

     }))
   .gesture(TapGesture()
             .onEnded({ time in
    viewModel.isNavigatingToUserSelectView.toggle()
   }))

 }
 
 fileprivate func buildMessages(viewModel: HomeViewModel) ->  some View {
  VStack {
   HomeViewNavigationBar(height: 55, userImageUrl: $viewModel.userImageUrl, imageSize: 45) {
    appState.appState = .Settings
   }
   ScrollView {
    VStack {
     ForEach(0...20, id : \.self) { item in
      NavigationLink {
       ChatView(chatUser: ChatUser(email: "fake@gmail.com", userProfileUrl: "", uid: ""))
      } label: {
     MessagePreviewTile(userImageUrl: .constant(nil), userName: "Eddie", tileText: "Lorem ipsum", receiveData: Date.now)
      }
     }
    }
   }
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


fileprivate extension Image {
 func visualModifier() -> some View {
  self
   .font(.title)
   .foregroundColor(.white)
   .frame(width: 55, height: 55, alignment: .center)
   .background(Color.green)
   .clipShape(Circle())
 }

}


