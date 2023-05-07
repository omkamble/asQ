//
//  SwiftUIView.swift
//  asQ
//
//  Created by OM KAMBLE on 07/05/23.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        NavigationView {
            VStack{
                ScrollView{
                    LazyVStack{
                        ForEach(0 ... 25, id: \.self) {
                            _ in
                           UserRowView()
                        }
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
