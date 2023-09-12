//
//  restPasowrd.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 17/02/1445 AH.
//

import SwiftUI

struct restForgetPassowrd: View {
    @State var num1 : String = ""
    @State var num2 : String = ""
    @State var num3 : String = ""
    @State var num4 : String = ""
    var body: some View {
     
        
        
        ZStack {
            Image("login")
                              .resizable()
                              .frame(width: .infinity,height:380)
                              
          
            VStack {
                Spacer()
                ZStack{
                   
                    Rectangle()
                        .fill(.white)
                        .frame(width: .infinity, height: 300)
                        .cornerRadius(50)
                        .shadow(color:Color("Color"), radius: 1.5)
                    VStack{
                        
             
                            
                            HStack{
                                
                                TextField("..", text: $num1)
                                  
                                    .foregroundColor(.black)
                                    .frame(width: 88,height: 62)
                                    .cornerRadius(20)
                                    .border(Color("Color"))
                                
                                TextField("..", text: $num2)
                                    .foregroundColor(.black)
                                    .frame(width: 88,height: 62)
                                   
                                    .border(Color("Color"))
                                TextField("..", text: $num3)
                                    .frame(width: 88,height: 62)
                                    .cornerRadius(30)
                                    .border(Color("Color"))
                                  
                                    
                                    
                                  
                                TextField("..", text: $num4)
                                    .foregroundColor(.black)
                                    .frame(width: 88,height: 62)
                                    .cornerRadius(9)
                                   
                                    .border(Color("Color"))
                                   
                            }
                            .padding()
                               
                  
                       
                        
                        Button(action: {
                     
                                             }, label: {
                                                 Text("Send")
                     
                                                     .frame(width: 138,height: 42,alignment: .center)
                                                   
                     
                                                     .font(.title3)
                                             }) .background(Color("Color"))
                                                 .foregroundColor(.white)
                                                 .frame(width: 138,height: 42,alignment: .center)
                                                 .cornerRadius(30)
                    }//Vst
                    
                }//zst
               
               
            }
        }.edgesIgnoringSafeArea(.all)
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

struct restForgetPassowrd_Previews: PreviewProvider {
    static var previews: some View {
        restForgetPassowrd()
    }
}
