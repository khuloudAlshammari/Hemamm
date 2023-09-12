//
//  HomeCompent.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 22/02/1445 AH.
//

import SwiftUI

struct HomeCompent: View {
    @EnvironmentObject var schoolData :DataSchoolVM
    
    var body: some View {
        TabView {
            //الانتقال م يشتغل
            ForEach(schoolData.allSchools, id:\.id) { school in
                ZStack {
                    Image("ho")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                       
      
                    VStack {
                        Text("❀\(school.name)❀")
                            .bold()
                            .padding(.top,30)

                        Text(school.desc)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding(22)
                    }

                }
 
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .foregroundColor(Color("Color"))

    }
}


struct HomeCompent_Previews: PreviewProvider {
    static var previews: some View {
        HomeCompent()
    }
}


