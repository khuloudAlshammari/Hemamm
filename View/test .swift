//
//  test .swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 21/02/1445 AH.
//
//
//import SwiftUI
//
//struct School {
//
//    @EnvironmentObject var dataSchoolsDetiels :  DataSchoolVM
//    var body: some View {
//        VStack(alignment: .leading){
//            Text("Syndrome dons")
//                .font(.title)
//            ScrollView{
//                ForEach(dataSchoolsDetiels.allSchools){ i in
//                    NavigationLink(
//                        destination: {}
//                        
//                        , label: {
//                            ZStack{
//                                Rectangle()
//                                    .fill(.red)
//                                    .frame(width: 382,height: 184)
//                                    .cornerRadius(26)
//                                Text(i.title)
//                                    .font(.title3)
//                                    .padding(.trailing,250)
//                                
//                            }
//                            
//                        }
//                    )
//                }
//                // .frame(alignment: .leading)
//            }
//        }//vstack
//        .padding()
//    }
//    
//}
