//
//  asQApp.swift
//  asQ
//
//  Created by OM KAMBLE on 07/05/23.
//

import SwiftUI
import Firebase
import IQKeyboardManagerSwift
@main
struct asQApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    init() {
        FirebaseApp.configure()
        IQKeyboardManager.shared.enable = true
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                //ContentView()
              ContentView()
            }
            .environmentObject(viewModel)

            
        }
        }
}


/*import SwiftUI
import FirebaseCore
content_copy


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
content_copy

    return true
  }
}

@main
struct YourApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
content_copy


  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
      }
    }
  }
}
*/

 
 
