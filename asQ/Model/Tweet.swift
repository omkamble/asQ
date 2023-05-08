//
//  Tweet.swift
//  asQ
//
//  Created by OM KAMBLE on 08/05/23.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var upvotes: Int
    var user : User?
    
    var didLike: Bool? = false
}
