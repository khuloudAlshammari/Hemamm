//
//   Home.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 17/02/1445 AH.
//

import SwiftUI

struct HomeView: View {
    @State var searchText: String = ""
    @State var tabBarVisibility: Visibility = .visible
    @EnvironmentObject var schoolData :DataSchoolVM
    
    @State private var filteredItems: [SchoolData] = []
    
    private let column = [
        GridItem(spacing:-12), //R spacing
        GridItem(spacing:-12)//spacing: 2
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 8) {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $searchText)
                    .onChange(of: searchText) { newValue in
                        filteredItems = schoolData.allSchools.filter {
                            $0.name.lowercased().contains(searchText.lowercased())
                        }
                    }
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(12)
            .padding()
            
            Spacer()
            
            if searchText.isEmpty {
                ScrollView {
                    VStack(alignment: .leading) {
                        HomeCompent()
                            .frame(height: 280)
                        Text("Sections :")
                            .bold()
//                                .font(.title)
                            .padding(.leading, 15)
                        
                        LazyVGrid(columns: column ,spacing:10) {   //C spacing
                            ForEach(SchoolType.allCases, id: \.self) { type in
                                NavigationLink(destination: {
                                    let schools = schoolData.allSchools.filter {
                                        $0.type == type
                                    }
                                    SchoolTypeListView(schools: schools, tabBarVisibility: $tabBarVisibility)
                                }, label: {
                                    ZStack(alignment: .bottom) {
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .background(type.color)
                                            .frame(width: 175, height:135)
                                            .cornerRadius(20)
                                            .shadow(color: (type.color), radius:  1.4)
                                        Text(type.title)
                                            .bold()
                                            .font(.system(size: 20))
                                            .foregroundColor(.white)
                                            .frame(width: 140, height: 40)
                                    }
                                    
                                })
                               // .navigationTitle(type.title)
                                
                            }
                        }
                    }
                }
                
            } else {
                ScrollView {
                    VStack {
                        ForEach(filteredItems, id: \.id) { school in
                            NavigationLink(
                                destination: {
                                    SchoolDetailsView(school: school)
                                }
                                , label: {
                                    ZStack {
                                        Image("sc")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: 164)
                                            .cornerRadius(26)
                                            .shadow(radius: 1)
                                        
                                        Text(school.name)
                                            .bold()
                                            .foregroundColor(.black)
                                    }
                                }//lab
                            )
                        }
                    }
                }
            }
        }
        .toolbar(.hidden, for: .navigationBar)
//            .toolbar(tabBarVisibility, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
//        .onAppear {
//            tabBarVisibility = .visible
//        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeView()
            .environmentObject(DataSchoolVM())
    }
}






