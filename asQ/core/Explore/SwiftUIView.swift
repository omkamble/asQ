//
//  SwiftUIView.swift
//  asQ
//
//  Created by OM KAMBLE on 07/05/23.
//

import SwiftUI

struct SwiftUIView: View {
    @ObservedObject var viewModel = exploreViewModel()
    var body: some View {
        VStack{
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.users) {
                        user in
                        UserRowView(user: user)
                    }
                }
            }
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
