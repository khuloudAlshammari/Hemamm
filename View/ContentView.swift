//
//  ContentView.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 25/02/1445 AH.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    @EnvironmentObject var schoolData: DataSchoolVM
    
    @State var didSplash: Bool = false
    @State var didOnboard: Bool = false
//    @AppStorage("didOnboard") var didOnboard: Bool = false
    
    var body: some View {
        Group{
            if didSplash {
                if didOnboard {
                    if authVM.user == nil {
                        // login
                        SignInView()
                    } else {
                        TabBarView()
                    }
                } else {
                    OnboardingView(didOnboard: $didOnboard)
                }
            } else {
                SplashScreenView(didSplash: $didSplash)
            }
        }
        .task {
            if authVM.checkSignIn() {
                await schoolData.fetchSchool()
                if let userID = authVM.user?.uid {
                    await schoolData.fetchFavorites(userID: userID)
                }
            }
            
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
