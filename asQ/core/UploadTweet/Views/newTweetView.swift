//
//  newTweetView.swift
//  asQ
//
//  Created by OM KAMBLE on 07/05/23.
//

import SwiftUI

struct newTweetView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = uploadTweetViewModel()
    
    var body: some View {
        VStack{
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()                }label: {
                 Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                Spacer()
                Button {
                    viewModel.uploadTweet(withCaption: caption)
                }label: {
                 Text("Tweet")
                        .bold()
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    
                }
            }
            .padding()
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 64, height: 64)
                
                TextArea("What's happening ?",text: $caption)
            }
            .padding()

        }
        .onReceive(viewModel.$didUploadTweet) { success in
            if success {
                presentationMode.wrappedValue.dismiss()
            }
            
        }
    }
}

struct newTweetView_Previews: PreviewProvider {
    static var previews: some View {
        newTweetView()
    }
}
