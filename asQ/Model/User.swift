//
//  User.swift
//  asQ
//
//  Created by OM KAMBLE on 08/05/23.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let email: String
}
