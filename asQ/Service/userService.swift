//
//  userService.swift
//  asQ
//
//  Created by OM KAMBLE on 07/05/23.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

struct userService {
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else  { return }
                guard let user = try? snapshot.data(as: User.self) else { return }
                
                completion(user)
                
            }
    }
    func fetchUsers(completion: @escaping([User]) -> Void) {
        var users = [User]()
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                
                documents.forEach { document in
                    guard let user = try? document.data(as: User.self) else { return }
                    users.append(user)
                }
                completion(users)
            }
    }
}
