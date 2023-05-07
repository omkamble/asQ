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
                    print("Tweet")
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
    }
}

struct newTweetView_Previews: PreviewProvider {
    static var previews: some View {
        newTweetView()
    }
}
