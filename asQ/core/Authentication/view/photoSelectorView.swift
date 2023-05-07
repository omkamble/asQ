//
//  photoSelectorView.swift
//  asQ
//
//  Created by OM KAMBLE on 07/05/23.
//

import SwiftUI

struct photoSelectorView: View {
    var body: some View {
        VStack{
            VStack(alignment: .leading) {
                HStack {Spacer()}
                Text("Hello")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("Welcome Back")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
            }
            .frame(height: 260)
            .padding(.leading)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            Spacer()
            
            Button {
                print("pick image here")
            } label: {
                Image("plusSign")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180, height: 180)
                    .padding(.top, 44)
            }
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct photoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        photoSelectorView()
    }
}
