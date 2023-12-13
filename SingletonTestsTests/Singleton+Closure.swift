//
//  Singleton+Closure.swift
//  SingletonTestsTests
//
//  Created by Abdul Ahad on 13.12.23.
//

import Foundation
import XCTest


class HttpClient {
    static let shared = HttpClient()
    private init(){}
    
    func login(completion: (LoggedInUser) -> Void) {
        print("ApiClient loginCalled")
        completion(LoggedInUser(name: "abdul"))
    }
}

// ViewModel
typealias LoginLoader = ((LoggedInUser) -> Void) -> Void
class LoginVC {
    var login: LoginLoader?
    func didTapLoginButton() -> LoggedInUser? {
        var loggedInUser :LoggedInUser?
        login? { user in
            loggedInUser = user
        }
        return loggedInUser
    }
}


class SingletonClosureTest:XCTestCase {
    func testDidTapLoginButton(){
        let loginVc = LoginVC()
        loginVc.login = { completion in
            print("Mock loginCalled")
            completion(LoggedInUser(name: "test"))
           }
        XCTAssertEqual(loginVc.didTapLoginButton()?.name,"test")

    }
}
