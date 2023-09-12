//
//  ScoolDeteals.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 17/02/1445 AH.
//

import SwiftUI

struct SchoolDetailsView: View {
    @EnvironmentObject var schoolData :DataSchoolVM
    let school : SchoolData
    //@State var schoolsName : SchoolData
    var body: some View {
        
        
        VStack(spacing:-10){
            Spacer()
            Image("login")
                .resizable()
                .frame(width: 300,height: 300)
            ZStack{
                Spacer()
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 550)
                    .foregroundColor(.white)
                    .cornerRadius(60)
                
                VStack{
                    HStack{
                        Text(school.name)
                            .font(.title2)
                            .padding(.top,16)
                        Spacer()
                        Image(systemName: "bookmark")
                            .font(.system(size: 35))
                    }
                    .padding()
                    Divider()
                        .background(Color("Color"))
                        .frame(maxWidth:.infinity)
                    HStack{
                        Text(school.desc)
                        padding(.leading,8)
                        
                    }.padding()
                    Divider()
                        .background(Color("Color"))
                    
                    HStack{
                        Text("Evalution :")
                        Spacer()
                        HStack{
                            if let rating = Int(school.star) {
                                ForEach(0..<rating) { j in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                }
                            }
                        }
                        //hstack
                        
                    }.padding()
                    Divider()
                        .background(Color("Color"))
                        .frame(maxWidth:.infinity)
                    HStack{
                        Text("Website :")
                        Spacer()
                        Link(school.web, destination: URL(string: school.web)!)
                        
                            .foregroundColor(.blue)
                    }.padding()
                    
                    Divider()
                        .background(Color("Color"))
                        .frame(maxWidth:.infinity)
                    
                    
                    HStack(spacing:20){
                        Button("Location") {
                            let url = URL(string: school.lok)!
                            UIApplication.shared.open(url)
                        }
                        .bold()
                        .frame(width: 168,height: 46)
                        .foregroundColor(.white)
                        .background(Color( hue: 0.571, saturation: 0.728, brightness: 0.547))
                        .clipShape(Capsule())
                        
                        Link(destination: URL(string: "https://wa.me/966\(school.number)")!) {
                            Text("WhatsApp")
                                .bold()
                                .frame(width: 168,height: 46)
                            
                                .foregroundColor(.white)
                            
                                .background(Color( hue: 0.571, saturation: 0.728, brightness: 0.547))
                                .clipShape(Capsule())
                        }
                    }.padding()
                    
                }
                
            }
            
            .padding(.bottom,-34)
        }//Vstak ==>First
        .background(
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.15, green: 0.47, blue: 0.7), location: 0.10),
                    Gradient.Stop(color: Color(red: 0.2, green: 0.6, blue: 0.86).opacity(0.3), location: 0.42),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
        )
        
        
    }
    
}

//struct ScoolDeteals_Previews: PreviewProvider {
//    static var previews: some View {
//        ScoolDeteals( schoolsName: <#[SchoolData]#>)
//    }
//}
//ظبطت
