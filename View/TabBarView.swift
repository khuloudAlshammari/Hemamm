//
//  TabBarView.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 17/02/1445 AH.
//

import SwiftUI

struct TabBarView: View {
    //  @EnvironmentObject var schoolData :DataSchoolVM
    
    var body: some View {
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
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
