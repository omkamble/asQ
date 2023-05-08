//
//  tweetRowViewModel.swift
//  asQ
//
//  Created by OM KAMBLE on 08/05/23.
//

import Foundation

class tweetRowViewModel: ObservableObject {
    @Published var tweet: Tweet
    private let service = tweetService()
    
    init(tweet: Tweet) {
        self.tweet = tweet
    }
    func likeTweet() {
        service.likeTweet(tweet) {
            self.tweet.didLike = true
        }
        
    }
    
    func unlikeTweet() {
        service.unlikeTweet(tweet) {
            self.tweet.didLike = false
        }
    }
    func checkIfUserLikedTweet() {
        service.checkIfUserLikedTweet(tweet) { didLike in
            if didLike {
                self.tweet.didLike = true
            }
            
        }
        
    }
}
