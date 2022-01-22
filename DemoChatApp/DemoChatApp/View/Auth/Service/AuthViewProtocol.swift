//
//  AuthViewProtocol.swift
//  DemoChatApp
//
//  Created by mehmet karanlık on 22.01.2022.
//

import Foundation
import UIKit

protocol AuthViewProtocol {
 func createNewAccount(email : String , password : String, passwordConfirm : String,image: UIImage?, completionHandler : @escaping CompletionHandler) -> Void
 func loginUser(email : String , password : String, completionHandler : @escaping CompletionHandler) -> Void
 func persistImageToStorage(uuid: String, image: UIImage?, email : String, password : String) -> Void
}
