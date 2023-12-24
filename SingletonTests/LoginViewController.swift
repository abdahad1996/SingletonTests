//
//  LoginViewController.swift
//  SingletonTests
//
//  Created by Abdul Ahad on 24.12.23.
//

import Foundation
import UIKit

struct LoggedInUser {
   let name:String
}
class APIClient {
    static let shared = APIClient()
    private init(){}
    
    func login(completion: (LoggedInUser) -> Void) {
        print("ApiClient loginCalled")
        completion(LoggedInUser(name: "abdul"))
    }
}


class LoginVC:UIViewController {
  
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    override func viewDidLoad() {
        didTapLoginButton()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @MainActor
    func didTapLoginButton() {
        APIClient.shared.login { user in
            
            self.view.backgroundColor = .red
            print(user)
        }
        
    }
   
}



