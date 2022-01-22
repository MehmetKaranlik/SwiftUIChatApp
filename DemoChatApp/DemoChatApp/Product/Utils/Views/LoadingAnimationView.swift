//
//  LoadingAnimationView.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 22.01.2022.
//

import SwiftUI
import Lottie
import UIKit

struct LoadingAnimationView : UIViewRepresentable {
 let fileName : String
 typealias UIViewType = UIView

 func makeUIView(context: UIViewRepresentableContext<LoadingAnimationView>) -> UIView {
  let view = UIView(frame: .zero)
  let animationView = AnimationView()
  let animation = Animation.named(fileName)
  animationView.animation = animation
  animationView.contentMode = .scaleAspectFit
  animationView.loopMode = .loop
  animationView.play()


  animationView.translatesAutoresizingMaskIntoConstraints = false

  view.addSubview(animationView)

  NSLayoutConstraint.activate([
   animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
   animationView.heightAnchor.constraint(equalTo: view.heightAnchor)

  ])



  return view
 }

 func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LoadingAnimationView>) {

 }




}

