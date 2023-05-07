//
//  tweetService.swift
//  asQ
//
//  Created by OM KAMBLE on 08/05/23.
//

import Foundation
import Firebase
import FirebaseFirestore
struct tweetService {
    func uploadTweet(caption: String, completion: @escaping(Bool) ->Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let data = ["uid":uid,
                    "caption":caption,
                    "upvotes": 0,
                    "timestamp":Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("tweets").document()
            .setData(data) { error in
                if let error = error {
                    print(error)
                    completion(false)
                    return
                }
                completion(true)
            }
    }
    func fetchTweets(completion: @escaping([Tweet]) -> Void) {
        Firestore.firestore().collection("tweets").getDocuments { snapshot, _ in
            
            guard let documents = snapshot?.documents else { return }
            
            let tweets = documents.compactMap({ try? $0.data(as:Tweet.self)})
            completion(tweets)
        }
    }
}
