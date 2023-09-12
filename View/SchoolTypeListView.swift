//
//  SchooleTest.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 21/02/1445 AH.
//

import SwiftUI

struct SchoolTypeListView: View {
    @EnvironmentObject var schoolData :DataSchoolVM
    let schools : [SchoolData]

    var body: some View {
        VStack(alignment: .leading) {
            //هينا في ايشو المسافات كبيرة بينهم
            ScrollView(){
                ForEach(schools){ school in
                    NavigationLink(
                        destination: {
                            SchoolDetailsView(school: school)
                        }
                        , label: {
                            ZStack{

                                Image("sc")
                                    .resizable()
                                    .frame(height: 160)
                                    .cornerRadius(12)
                                    .aspectRatio(contentMode: .fit)

                                    .padding(20)
                                    .shadow(color: Color("Color"),radius: 1.2)
                                Text(school.name)
                                    .bold()
                                    .foregroundColor(.black)

                            }//zst.

                        }//lab
                    )//nav
                }//forE
                  }//scroll

        }//vstack
    }//body
}//view

//struct Schoole_Previews: PreviewProvider {
//    static var previews: some View {
//        Schoole(schoolData: DataSchoolVM())
//    }
//}

