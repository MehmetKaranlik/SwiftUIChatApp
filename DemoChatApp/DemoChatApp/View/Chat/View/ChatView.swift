 //
 //  ChatView.swift
 //  DemoChatApp
 //
 //  Created by mehmet karanlık on 27.01.2022.
 //

import SwiftUI

struct ChatView: View {
 let userName : String
 let userImageUrl : String
 @ObservedObject var viewModel : ChatViewModel = ChatViewModel()
 @ObservedObject var appState : NavigationController = NavigationController.shared









 var body: some View {
 //  buildNavigationBar()
  ZStack {
   buildMessages()
   buildUpperStack()
  }
  .toolbar {
   ToolbarItem(placement:.navigationBarTrailing) {
    AsyncCircularAvatarView(userImageUrl: .constant(userImageUrl), radius: 40)
   }
  }


 }





 fileprivate func buildUpperStack() -> some View {
  VStack {
   Spacer()
   buildInputRow()
  }
 }



 fileprivate func buildMessages() -> some View {
   ScrollView(showsIndicators: false) {
   ForEach(0...25, id : \.self) { index in
    buildMessageRow(index)
   }
   .padding(.horizontal,5)
  }
 }




 fileprivate func buildMessageRow(_ index: Int) -> some View {
  HStack(alignment:.center) {
   if index%2 == 0 {
    Spacer(minLength: 50)
   }
   buildMessageBox(index)

   if index%2 != 0 {
    Spacer(minLength: 50)
   }
  }
  .padding(.vertical, 5)
 }


 fileprivate func buildMessageBox(_ index : Int) -> some View {
  HStack(alignment: .center) {
   Text(
    """
    Fake message
    """
    )
    .font(.system(size:11))
    .foregroundColor(.white)
  }
  .modifier(MessageBoxViewModifier(index: index))
 }

 fileprivate func buildInputRow() -> some View {
   HStack {
   Spacer()
   buildImagePickerButton()
   buildTextField()
   buildSendButton()
   Spacer()
  }
  .frame(height: 80, alignment: .center)
  .background(Color.gray.opacity(0.8))
 }


 fileprivate func buildSendButton() -> some View {
   Button {

  } label: {
   Image(systemName: "paperplane.fill")
    .font(.title)
  }
 }

 fileprivate func buildTextField() -> some View {
   TextField("", text: .constant("hellö"), prompt: Text("Type it!"))
   .modifier(TextFieldModifier())

 }

 fileprivate func buildImagePickerButton() ->  some View {
  Button {} label: {
   Image(systemName: "photo.on.rectangle.angled")
    .font(.title)
  }
 }




}

struct ChatView_Previews: PreviewProvider {
 static var previews: some View {
  ChatView(userName: "fake@gmail.com", userImageUrl: "")
 }
}


fileprivate struct  MessageBoxViewModifier: ViewModifier {
 let index : Int
 func body(content: Content) -> some View {
  content
   .multilineTextAlignment(index.isMultiple(of: 2) ?.trailing : .leading)
   .frame(minHeight: 30)
   .padding(.vertical,7)
   .padding(.horizontal,10)
   .background(index.isMultiple(of: 2) ?  Color.green : Color.mint)
   .cornerRadius(12)
   .shadow(color: .black.opacity(0.3), radius: 5, y: 5)
 }
}


fileprivate struct TextFieldModifier: ViewModifier {
 func body(content: Content) -> some View {
  content
   .foregroundColor(.white)
   .padding()
   .background(RoundedRectangle(cornerRadius: .infinity).stroke(lineWidth: 2).foregroundColor(.green).ignoresSafeArea())
   .frame(width: 250, height: 40, alignment: .center)
 }
}
