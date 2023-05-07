//
//  registrationView.swift
//  asQ
//
//  Created by OM KAMBLE on 07/05/23.
//

import SwiftUI

struct registrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack {
            
            NavigationLink(destination: photoSelectorView(), isActive: $viewModel.didAuthUser, label: { })
            
            VStack(alignment: .leading) {
                HStack {Spacer()}
                Text("Get Started")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("Create Your Account")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
            }
            .frame(height: 260)
            .padding(.leading)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            
            VStack(spacing: 40) {
                TextField("Email", text: $email)
                TextField("Username", text: $username)
                TextField("full Name", text: $fullname)
                TextField("Password", text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            Button {
                viewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
                
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
                
            } label: {
                HStack {
                    Text("already have an account ?")
                    Text("sign in")
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color(.systemBlue))
        }
        .ignoresSafeArea()
        
    }
}

struct registrationView_Previews: PreviewProvider {
    static var previews: some View {
        registrationView()
    }
}
