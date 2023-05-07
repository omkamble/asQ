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
    
    init() {
        fetchTweets()
    }
    func fetchTweets() {
        service.fetchTweets() { tweets in
            self.tweets = tweets
        }
    }
}
