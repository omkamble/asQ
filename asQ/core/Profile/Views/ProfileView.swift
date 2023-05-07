//
//  ProfileView.swift
//  asQ
//
//  Created by OM KAMBLE on 07/05/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            headerView
            actionButtons
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text("Heath Sledger")
                        .font(.title2).bold()
                    
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(Color(.systemBlue))
                }
                
                Text("@joker")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
           
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    var headerView: some View {
        ZStack (alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
        
            VStack {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: 12)
                }
                
                Circle()
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y: 24)
            }
            
            
            
        }
        .frame(height: 96)
    }
    
    var actionButtons: some View{
        HStack(spacing: 12) {
            Spacer()
            Button {
                
            } label: {
                Text("Edit profile")
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
        }
    }
}
