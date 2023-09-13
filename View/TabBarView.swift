//
//  TabBarView.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 17/02/1445 AH.
//

import SwiftUI

enum Tab {
    case home
    case myList
    case account
}

struct TabBarView: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    //  @EnvironmentObject var schoolData :DataSchoolVM
    
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        if let user = authVM.user {
            NavigationView {
                TabView {
                    // vm: DataSchoolVM()
                    HomeView()
                        .tabItem {
                            Image(systemName: "house.fill")
                        }
                    
                    if !user.isAnonymous {
                        MyListView()
                            .tabItem{
                                Image(systemName: "bookmark")
                            }
                    }
                    

                    ProfileView()
                        .tabItem{
                            Image(systemName: "person.crop.circle")
                        }
                }
            }
            .accentColor(Color("Color"))
        }
        
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
