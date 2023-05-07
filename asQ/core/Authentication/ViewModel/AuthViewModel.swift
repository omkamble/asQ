//
//  AuthViewModel.swift
//  asQ
//
//  Created by OM KAMBLE on 07/05/23.
//

import Foundation
import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        print("Debug")
    }
    func login(withEmail email: String, password: String) {
        print("login with email")
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) {result, error in
            if let e = error {
                print(e)
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            print("registered user")
            print("user is \(self.userSession)")
            
            let data = ["email": email, "username": username.lowercased(), "fullname": fullname, "uid": user.uid]
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    print("Debugged")
                    
                }
        }
    }
    func signout() {
        userSession = nil
        try? Auth.auth().signOut()
    }
    
}
