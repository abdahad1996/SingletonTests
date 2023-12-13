//
//  SingletonTestsTests.swift
//  SingletonTestsTests
//
//  Created by Abdul Ahad on 13.12.23.
//

import XCTest
import Foundation

 struct LoggedInUser {
    let name:String
}
 
 class ApiClient {
    static let instance = ApiClient()

    init() {}

      func login(completion: (LoggedInUser) -> Void) {
        print("ApiClient loginCalled")
        completion(LoggedInUser(name: "abdul"))
    }
}

 class MockApiClient: ApiClient {
    override func login(completion: (LoggedInUser) -> Void) {
        // override login behavior here for tests
        print("MockApiClient loginCalled")
        completion(LoggedInUser(name: "test"))
    }
}

private class LoginViewController {
    var api = ApiClient.instance
    
    func didTapLoginButton() -> LoggedInUser? {
        var loggedInUser :LoggedInUser?
        api.login() { user in
            loggedInUser = user
        }
        return loggedInUser
    }
}

private final class SingletonSubclassTests: XCTestCase {

    func testDidTapLogin(){
        let loginVc = LoginViewController()
        loginVc.api = MockApiClient()
        
         
        XCTAssertEqual(loginVc.didTapLoginButton()?.name,"test")
       
    }

}
