//
//  feedViewModel.swift
//  asQ
//
//  Created by OM KAMBLE on 08/05/23.
//

import Foundation

class feedViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    let service = tweetService()
    let UserService = userService()
    init() {
        fetchTweets()
    }
    func fetchTweets() {
        service.fetchTweets() { tweets in
            self.tweets = tweets
            
            for i in 0 ..< tweets.count {
                let uid = tweets[i].uid
            
                tweets.forEach { tweet in
                    let uid = tweet.uid
                    
                    self.UserService.fetchUser(withUid: uid) { user in
                        self.tweets[i].user = user
                    }
                }
            }
        }
    }
}
