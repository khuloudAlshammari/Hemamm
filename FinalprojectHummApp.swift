//
//  FinalprojectHummApp.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 16/02/1445 AH.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct FinalprojectHummApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    let authVM = AuthViewModel()
    @ObservedObject var schoolData = DataSchoolVM()
    
    var body: some Scene {
        WindowGroup {

               ContentView()
                .environmentObject(schoolData)
                .environmentObject(authVM)
            
        }
    }
}

