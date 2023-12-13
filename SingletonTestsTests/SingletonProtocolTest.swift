//
//  SingletonProtocolTest.swift
//  SingletonTestsTests
//
//  Created by Abdul Ahad on 13.12.23.
//

import Foundation


import XCTest
import Foundation

protocol loginProtocol {
      func login(completion: (LoggedInUser) -> Void)
}

class NetworkClient:loginProtocol{
    static let shared = NetworkClient()
    private init(){}
    func login(completion: (LoggedInUser) -> Void) {
        completion(LoggedInUser(name: "abdul"))
    }
    
}

class MockNetworkClient:loginProtocol{
    func login(completion: (LoggedInUser) -> Void) {
        completion(LoggedInUser(name: "test"))
    }
    
}

class LoginView {
    let api : loginProtocol
    
    init(api: loginProtocol) {
        self.api = api
    }
    
    func didTapLoginButton() -> LoggedInUser? {
        var loggedInUser :LoggedInUser?
        api.login() { user in
            loggedInUser = user
        }
        return loggedInUser
    }
}

final class SingletonProtocolTests: XCTestCase {

    func testDidTapLogin(){
        let loginVc = LoginView(api: MockNetworkClient())
         
        XCTAssertEqual(loginVc.didTapLoginButton()?.name,"test")
       
    }

}

