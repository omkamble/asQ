//
//  exploreViewModel.swift
//  asQ
//
//  Created by OM KAMBLE on 08/05/23.
//

import Foundation
class exploreViewModel: ObservableObject {
    @Published var users = [User]()
    
    let service = userService()
    
    init() {
        fetchUsers()
    }
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
            print(users)
            
        }
    }
}
