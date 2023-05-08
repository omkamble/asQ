//
//  tweetService.swift
//  asQ
//
//  Created by OM KAMBLE on 08/05/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseCore
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
        Firestore.firestore().collection("tweets")
            .order(by: "upvotes", descending: true)
            .getDocuments { snapshot, _ in
            
            guard let documents = snapshot?.documents else { return }
            
            let tweets = documents.compactMap({ try? $0.data(as:Tweet.self)})
            completion(tweets)
        }
    }
    func likeTweet(_ tweet: Tweet, completion: @escaping() -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let tweetId = tweet.id else { return }
        let userLikesRef = Firestore.firestore().collection("users").document(uid).collection("user-likes")
        
        Firestore.firestore().collection("upvotes").document(tweet.id ?? "")
            .updateData(["upvotes": tweet.upvotes + 1])  { _ in
                userLikesRef.document(tweetId).setData([:]) { _ in
                    completion()
                }
            }
        
    }
    func unlikeTweet(_ tweet: Tweet, completion: @escaping() -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let tweetId = tweet.id else { return }
        guard tweet.upvotes > 0 else { return }
        
        let userLikesRef = Firestore.firestore().collection("users").document(uid).collection("user-likes")
        
        Firestore.firestore().collection("upvotes").document(tweet.id ?? "")
            .updateData(["upvotes": tweet.upvotes - 1]) { _ in
                userLikesRef.document(tweetId).delete { _ in
                    completion()
                }
            }
    }
    
    
    
    func checkIfUserLikedTweet(_ tweet: Tweet, completion : @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let tweetId = tweet.id else { return }
        Firestore.firestore().collection("users")
            .document(uid)
            .collection("user-likes")
            .document(tweetId).getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                completion(snapshot.exists)
            }
    }
}
