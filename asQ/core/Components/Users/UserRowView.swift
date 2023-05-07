//
//  UserRowView.swift
//  asQ
//
//  Created by OM KAMBLE on 07/05/23.
//

import SwiftUI

struct UserRowView: View {
    let user: User
    var body: some View {
        HStack(spacing: 12){
            Circle()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 4){
                Text(user.username)
                    .font(.subheadline).bold()
                
                Text(user.fullname)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
        
    }
}

//struct UserRowView_Previews: PreviewProvider {
  //  static var previews: some View {
    //    UserRowView()
//    }
//}
