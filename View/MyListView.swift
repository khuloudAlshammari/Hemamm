//
//   MyList.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 17/02/1445 AH.
//

import SwiftUI

struct MyListView: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    @EnvironmentObject var schoolData: DataSchoolVM
    
    @State private var userLsit: [Favorite] = []
   
    var body: some View {
        ScrollView {
            //احتاج احط انتقال للتفاصيل من هينا
            ForEach(userLsit, id: \.id) { favorite in
                let school = schoolData.allSchools.first {
                    $0.name == favorite.name
                }!
                
                NavigationLink(
                    destination: {
                        SchoolDetailsView(school: school)
                    }
                    , label: {
                        ZStack{

                            Image("77")
                                .resizable()
                                .frame(height: 160)
                                .cornerRadius(12)
                                .aspectRatio(contentMode: .fit)

                            VStack{
                                Text(school.name)
                                    .bold()
                                    .foregroundColor(.black)
                                HStack{
                                    if let rating = Int(school.star) {
                                        ForEach(0..<rating, id: \.self) { j in
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.yellow)
                                        }
                                    }
                                }.padding(12)
                            }

                        }//zst.
                        .padding(12)
                    }//lab
                )//nav
            }
            Spacer()
        }
        .padding()
        .onAppear {
            userLsit = schoolData.userList
        }
    }
}

struct _MyList_Previews: PreviewProvider {
    static var previews: some View {
        MyListView()
    }
}
