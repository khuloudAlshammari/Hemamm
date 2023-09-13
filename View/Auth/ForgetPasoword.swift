//
//  ForgetPasoword.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 16/02/1445 AH.
//



import SwiftUI
import FirebaseAuth

struct ForgetPasoword: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var Email :String = ""
  
    var body: some View {

        
        ZStack {
            Image("login")
                              .resizable()
                              .aspectRatio(contentMode: .fit)
                              //.frame(width: .infinity,height:380)
                              .padding(.bottom,120)
          
            VStack {
                Spacer()
                ZStack{
                   
                    Rectangle()
                        .fill(.white)
                        .frame(maxWidth:.infinity)
                        .frame(height: 350)
                        .cornerRadius(40)
//                        .shadow(color:Color("Color"), radius: 1.5)
                    VStack{
                        HStack{
                            Text("Forgot Password")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .frame(alignment: .leading)
                        }.padding(.trailing,90)
                       
                        
                        HStack{
                            Image(systemName: "envelope")
                            TextField("Email", text: $Email)
                                .padding(10)
                        }.padding()
                        Divider()
                            .background(Color("Color"))
                        .frame(width: 360)
                        .padding()
                        Button(action: {
                            forgetPasooword(Email: Email)
                                             }, label: {
                                                 Text("Send")
                                                     .bold()
                                                     .frame(width: 160,height: 42,alignment: .center)
                                                     .background(Color("Color"))
                                                     .foregroundColor(.white)
                                                     .cornerRadius(40)
                                             })
                                             HStack{
                                                 Button(
                                                     action: {
                                                         //abudallah
                                                         dismiss()
                                                     },
                                                     label: {
                                                         Text("Back to Log In")
                                                             .foregroundColor(.black)
                                                             //.padding(.trailing,253)
                                                             
                                                     }
                                                 ).padding()
                                                
                                               Spacer()
                                                 
                                            
                                             }
                        
                    }//Vst
                    
                }//zst
               
               
            }
        }//zstack
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
    func forgetPasooword (Email :String){
        Auth.auth().sendPasswordReset(withEmail: Email){ eroor in
            if eroor != nil  {
                print("good")
            }else{
               
                print("error")

            }
        }
        
    }
    }


struct ForgetPasoword_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPasoword().navigationBarBackButtonHidden(true)
       
    }
}
