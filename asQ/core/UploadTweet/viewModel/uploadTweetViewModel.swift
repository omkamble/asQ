//
//  uploadTweetViewModel.swift
//  asQ
//
//  Created by OM KAMBLE on 08/05/23.
//

import Foundation

class uploadTweetViewModel: ObservableObject {
    @Published var didUploadTweet = false
    let service = tweetService()
    
    func uploadTweet(withCaption caption: String) {
        service.uploadTweet(caption: caption) { success in
            if success {
                
            } else{
                
            }
            
        }
    }
}
