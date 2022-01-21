//
//  ImagePicker.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 22.01.2022.
//

import SwiftUI
import UIKit


struct ImagePicker: UIViewControllerRepresentable {

 @Binding var image: UIImage?

 private let controller = UIImagePickerController()

 func makeCoordinator() -> Coordinator {
  return Coordinator(parent: self)
 }

 class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  let parent: ImagePicker

  init(parent: ImagePicker) {
   self.parent = parent
  }

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
   guard let temp = info[.originalImage] as? UIImage else {return }
   temp.jpegData(compressionQuality: 0.2)
   parent.image = temp
   print("image updated")
   picker.dismiss(animated: true)
  }

  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
   picker.dismiss(animated: true)

  }

 }

 func makeUIViewController(context: Context) -> some UIViewController {
  controller.delegate = context.coordinator
  return controller
 }

 func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

 }

}
