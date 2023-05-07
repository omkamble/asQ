//
//  SideMenuViewModel.swift
//  asQ
//
//  Created by OM KAMBLE on 07/05/23.
//

import Foundation

enum SideMenuViewModel: Int, CaseIterable{
case profile
case logout
  
    
    var title: String {
        switch self{
        case .profile: return "Profile"
        case .logout: return "Logout"
            
        
        }
    }
    var imageName: String {
        switch self {
        case .profile: return "person"
        case .logout: return "arrow.left.square"
        }
    }
}
