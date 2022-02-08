 //
 //  ChatView.swift
 //  DemoChatApp
 //
 //  Created by mehmet karanlık on 27.01.2022.
 //

import SwiftUI

struct ChatView: View {
 let chatUser : ChatUser
 @ObservedObject var viewModel : ChatViewModel

 init(chatUser: ChatUser) {
  self.chatUser = chatUser
  viewModel = ChatViewModel(chatUser: self.chatUser)
 }


 var body: some View {
 //  buildNavigationBar()
  ZStack {
   buildMessages()
   buildUpperStack()
  }
  .toolbar {
   ToolbarItem(placement:.navigationBarTrailing) {
    buildToolbarItem()
   }
  }


 }

 fileprivate func buildToolbarItem() -> some View {
  return HStack {
   Text(self.chatUser.userEmail)
    .font(.title2)
    .foregroundColor(.green.opacity(0.8))
    .blur(radius: UIConstants.blurRadius)
   DynamicHorizontalSpacer(size: 50)
   AsyncCircularAvatarView(userImageUrl: .constant(self.chatUser.userProfileUrl), radius: 40)
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
    ForEach(viewModel.messages, id: \.self) { item in
    buildMessageRow(item)
   }
   .padding(.horizontal,5)
  }
 }

 fileprivate func buildMessageRow(_ item: Message) -> some View {
  HStack(alignment:.center) {

   buildMessageBox(item)

  }
  .padding(.vertical, 5)
 }

 fileprivate func buildMessageBox(_ item : Message) -> some View {
  HStack(alignment: .center) {
   Text(
    item.text
    )
    .font(.system(size:11))
    .foregroundColor(.white)
  }
  .modifier(MessageBoxViewModifier(item: item))
 }

 fileprivate func buildInputRow() -> some View {
   HStack {
   Spacer()
   buildImagePickerButton()
   buildTextField()
   buildSendButton()
   Spacer()
  }
  .frame(height: 50, alignment: .center)
  .background(Color(hex: 0xEEEEEE,alpha: 1))
 }


 fileprivate func buildSendButton() -> some View {
   Button {
    viewModel.submitMessage()
  } label: {
   Image(systemName: "paperplane.fill")
    .font(.title)
  }
 }

 fileprivate func buildTextField() -> some View {
  TextField("", text: $viewModel.messageText, prompt: Text("Type it!"))
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
  ChatView(chatUser: .init(email: "fake@gmail.com", userProfileUrl: "", uid: ""))
 }
}

fileprivate struct  MessageBoxViewModifier: ViewModifier {
 let item : Message
 func body(content: Content) -> some View {
  content
   .multilineTextAlignment(.trailing )
   .frame(minHeight: 30)
   .padding(.vertical,7)
   .padding(.horizontal,10)
   .background(Color.green)
   .cornerRadius(12)
   .shadow(color: .black.opacity(0.3), radius: 5, y: 5)
 }
}

fileprivate struct TextFieldModifier: ViewModifier {
 func body(content: Content) -> some View {
  content
   .foregroundColor(.black)
   .padding()
   .frame(width: 250, height: 35, alignment: .center)
   .background(RoundedRectangle(cornerRadius: .infinity).stroke(lineWidth: 2).foregroundColor(.green).ignoresSafeArea())

 }
}
