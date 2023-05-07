//
//  TweetRowView.swift
//  asQ
//
//  Created by OM KAMBLE on 07/05/23.
//

import SwiftUI

struct TweetRowView: View {
    let tweet : Tweet
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                
                VStack(alignment: .leading, spacing: 4){
                    HStack{
                        Text("bruce wayne")
                            .font(.subheadline).bold()
                        Text("@batman")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    Text(tweet.caption)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            
                
            HStack{
                Button{
                    
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                Spacer()
                    
               

                Button{
                    
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                Spacer()

                
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
    }
}


