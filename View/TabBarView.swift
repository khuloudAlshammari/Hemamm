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
    //  @EnvironmentObject var schoolData :DataSchoolVM
    
    @State private var selectedTab: Tab = .home
    
    var body: some View {
//        VStack {
//            switch selectedTab {
//            case .home: HomeView()
//            case .myList: MyList()
//            case .account: ProfileView()
//            }
//            Divider()
//            HStack {
//                Button {
//                    selectedTab = .home
//                } label: {
//                    Image(systemName: "house.fill")
//                }
//
//                Button {
//                    selectedTab = .myList
//                } label: {
//                    Image(systemName: "house.fill")
//                }
//
//                Button {
//                    selectedTab = .account
//                } label: {
//                    Image(systemName: "house.fill")
//                }
//
//            }
//        }
        NavigationView {
            TabView {
                // vm: DataSchoolVM()
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                    }

                MyList()
                    .tabItem{
                        Image(systemName: "bookmark")
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

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
