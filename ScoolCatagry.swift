//
//  ScoolCatagry.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 17/02/1445 AH.
//
//
//import SwiftUI
//
//struct ScoolCatagry: View {
//    var body: some View {
//        @EnvironmentObject var dataSchoolsCatagory :  DataSchoolVM
//        VStack(alignment: .leading){
//        Text("متلازمة داون")
//        .font(.title)
//            ScrollView{
//                ZStack(alignment: .bottomLeading){
//                    Image("onb1")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 350,height: 184)
//                        .cornerRadius(25)
//                    
//                    Text("")
//                         .font(.title2)
//                        .foregroundColor(.white)
//                    
//                    
//                }
//                .padding()
//                
//                ZStack(alignment: .bottomLeading){
//                    Image("onb1")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 350,height: 184)
//                        .cornerRadius(25)
//                  //  ForEach(SchoolJasonData.Type,id: \.self){
//                        Text("school name")
//                            .font(.title2)
//                            .foregroundColor(.white)
//                        
//                    }}
//                ZStack(alignment: .bottomLeading){
//                    Image("school")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 350,height: .infinity)
//                        .cornerRadius(25)
//                    
//                    Text("school name")
//                        .font(.title2)
//                        .foregroundColor(.white)
//                    
//                }
//            }
//            
//            
//            
//        }
//    }
//
//
//struct ScoolCatagry_Previews: PreviewProvider {
//    static var previews: some View {
//        ScoolCatagry()
//    }
//}
