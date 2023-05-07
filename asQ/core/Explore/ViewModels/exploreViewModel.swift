//
//  exploreViewModel.swift
//  asQ
//
//  Created by OM KAMBLE on 08/05/23.
//

import Foundation
class exploreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    var searchableUsers: [User] {
        if searchText.isEmpty {
            return users
        } else{
            let lowercasedQuery = searchText.lowercased()
            
            return users.filter({
                $0.username.contains(lowercasedQuery) ||
                $0.fullname.lowercased().contains(lowercasedQuery)
            })
        }
    }
    
    let service = userService()
    
    init() {
        fetchUsers()
    }
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
            
            
        }
    }
}
