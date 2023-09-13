//
//  HomeCompent.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 22/02/1445 AH.
//

import SwiftUI

struct HomeCompent: View {
    @EnvironmentObject var schoolData :DataSchoolVM
    @State private var selectedTab: Int = 0
    
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .red
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
        }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            //الانتقال م يشتغل
            ForEach(0..<schoolData.allSchools.count, id:\.self) { i in
                let school = schoolData.allSchools[i]
                NavigationLink(destination: SchoolDetailsView(school: school)) {
                    ZStack {
                        Image("77")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(12)
          
                        VStack {
                            Text("❀\(school.name)❀")
                                .bold()
                                .padding(.top,8)

                            Text(school.desc)
                                .padding(.top,8)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 22)
                        }

                    }
                }
                .tag(i)
                
 
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .tint(.green)
        .foregroundColor(Color("Color"))
        .onReceive(timer) { input in
            if selectedTab >= schoolData.allSchools.count {
                withAnimation {
                    selectedTab = 0
                }
            } else {
                withAnimation {
                    selectedTab += 1
                }
            }
        }

    }
}


struct HomeCompent_Previews: PreviewProvider {
    static var previews: some View {
        HomeCompent()
    }
}


