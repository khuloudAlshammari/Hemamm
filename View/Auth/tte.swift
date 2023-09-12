//
//  tte.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 18/02/1445 AH.
//

import SwiftUI

struct tte: View {
    @State var userName :String = ""
    @State var Email :String = ""
    @State var pasoword :String = ""
    @State var showaleart : Bool = false

    var body: some View {
   
            VStack(spacing:-5) {
        
                Image("login")
                                  .resizable()
                                  .frame(width: .infinity,height:220)
                ZStack{
                   
                    Rectangle()
                        .fill(.white)
                        .frame(width: .infinity, height: 670)
                        .cornerRadius(40)
                        .shadow(color:Color("Color"), radius: 1.5)
                    VStack(spacing:8){
                        Text("Log into your account")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .frame(alignment: .leading)
                        
                        HStack{
                            Image(systemName: "envelope")
                            TextField("Email", text: $Email)
                                .padding(10)
                        }.padding()
                        Divider()
                            .background(Color("Color"))
                        .frame(width: 360)
                        HStack{
                            Image(systemName: "envelope")
                            TextField("Email", text: $Email)
                                .padding(10)
                        }.padding()
                        Divider()
                            .background(Color("Color"))
                        .frame(width: 360)
                        HStack{
                            Image(systemName: "envelope")
                            TextField("Email", text: $Email)
                                .padding(10)
                        }.padding()
                        Divider()
                            .background(Color("Color"))
                        .frame(width: 360)
                        HStack{
                            Image(systemName: "envelope")
                            TextField("Email", text: $Email)
                                
                                .padding(10)
                        }.padding()
                        Divider()
                            .background(Color("Color"))
                        .frame(width: 360)
                        Button(action: {
                     
                                             }, label: {
                                                 Text("Send")
                     
                                                     .frame(width: 138,height: 42,alignment: .center)
                     
                                                     .font(.title3)
                                             })
                      
                        
                        
                        
                        
                        
                        
                        
                        .background(Color("Color"))
                                                 .foregroundColor(.white)
                                                 .frame(width: 138,height: 42,alignment: .center)
                 
                                                 .cornerRadius(40)
                                                 
                                           
                    }//Vst
                    
                }//zst
               
               
            }
        //zstack
        .edgesIgnoringSafeArea(.all)
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

struct tte_Previews: PreviewProvider {
    static var previews: some View {
        tte()
    }
}
