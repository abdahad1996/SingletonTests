//
//  ContentView.swift
//  SingletonTests
//
//  Created by Abdul Ahad on 13.12.23.
//

import SwiftUI

// SwiftUI wrapper for the UIViewController
struct UIViewControllerWrapper: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: LoginVC, context: Context) {
        
    }
    
    typealias UIViewControllerType = LoginVC

    func makeUIViewController(context: Context) -> LoginVC {
        return LoginVC()
    }

    
}

struct ContentView: View {
    var body: some View {
        VStack {
            UIViewControllerWrapper()
        }
        .padding()
    }
}

 
