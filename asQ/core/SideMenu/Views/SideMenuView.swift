//
//  SideMenuView.swift
//  asQ
//
//  Created by OM KAMBLE on 07/05/23.
//

import SwiftUI

struct SideMenuView: View {
 @EnvironmentObject var authViewModel: AuthViewModel
 var body: some View {
 
 VStack{
 Circle()
 .frame(width: 48, height: 48)
 VStack(alignment: .leading, spacing: 4) {
 Text("Bruce Wayne")
 .font(.headline)
 
 Text("@batman")
 .font(.caption)
 .foregroundColor(.gray)
 }
 ForEach(SideMenuViewModel.allCases,id: \.rawValue ) {
 viewModel in
 
 if viewModel == .profile {
 NavigationLink {
 ProfileView()
 } label: {
 SideMenuOptionRowView(viewModel: viewModel)
 }
 } else if viewModel == .logout {
 Button {
 authViewModel.signOut()
 } label: {
 SideMenuOptionRowView(viewModel: viewModel)
 }
 
 } else {
 SideMenuOptionRowView(viewModel: viewModel)
 }
 
 }
 
 Spacer()
 }
 }
 }
 
 struct SideMenuView_Previews: PreviewProvider {
 static var previews: some View {
 SideMenuView()
 }
 }

 
