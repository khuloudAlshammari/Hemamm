//
//  SignIn.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 16/02/1445 AH.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore

struct SignInView: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    @EnvironmentObject var schoolData: DataSchoolVM
    
    @State var Email :String = ""
    @State var pasoword :String = ""
    @State var showAlert : Bool = false
    @State var alertMessage : String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing:-1) {
               
                Spacer()
                
                Image("login")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    //.frame(height: 300)
                
                
                ZStack{
                    Rectangle()
                        .frame(height: 530)
                        .foregroundColor(.white)
                        .cornerRadius(50)
                        //.shadow(color:Color("Color"), radius: 1.5)
                    
                    VStack{
                        HStack{
                            Text("Log into your account")
                                .font(.title)
                                .foregroundColor(.black)
                                .padding(.top,-50)
                                 
                            
                            
                        }.padding(.trailing,50)
                        
                        
                        HStack{
                            Image(systemName: "envelope")
                            TextField("Email", text: $Email)
                                .padding()
                        }.padding()
                        Divider()
                            .background(Color("Color"))
                            .frame(width: 360)
                        HStack{
                            Image(systemName: "lock")
                            SecureField("Pasoword", text: $pasoword)
                                .padding(10)
                        }.padding()
                        Divider()
                            .background(Color("Color"))
                            .frame(width: 360)
                        
                        
                        NavigationLink(
                            destination: {
                            ForgetPasoword().navigationBarBackButtonHidden(true)
                        }, label: {
                            Text("forgetPasoword")
                                .padding(.leading,230)
                                .foregroundColor(.black)
                         }
                        )
                        HStack(){
                            Button(action: {
                                signIn(email: Email, password: pasoword)
                                
                            }, label: {
                                Text("Sign In")
                                    .bold()
                                    .frame(width: 140,height: 42)
                                
                            })
                            .background(Color("Color"))
                            .foregroundColor(.white)
                            .cornerRadius(40)
                            .padding(16)
                            
                            Button(action: {
                                guest()
                                
                            }, label: {
                                
                                Text("Guest")
                                    .bold()
                                    .frame(width: 140,height: 42)

                                    .background (
                                        RoundedRectangle(cornerRadius:
                                                            40)
                                        .stroke(Color("Color")))
                                    
                            }).buttonStyle(.plain)
                           // .background(Color("Color"))
                            
                            
                           
                            
                        }
                        
                        
                        HStack(spacing: 10){
                            Text("Don’t have an account?")
                                .padding(.trailing,-10)
                            NavigationLink(destination: {
                                
                                SignUpView()
                                    .navigationBarBackButtonHidden(true)
                            }, label: {
                                Text("؟")
                                    .foregroundColor(.black)
                                Text("Sign Up")
                                    .foregroundColor(.blue)
                            })
                        
                            
                        }
                        .padding(.trailing,160)
                          
                    }
                }.padding(.bottom,-34)
          
                
            } .background(
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.15, green: 0.47, blue: 0.7), location: 0.10),
                        Gradient.Stop(color: Color(red: 0.2, green: 0.6, blue: 0.86).opacity(0.3), location: 0.42),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: 0),
                    endPoint: UnitPoint(x: 0.5, y: 1)
                )
            )
            .alert("Error", isPresented: $showAlert) {
                Button(role: .cancel, action: {}) {
                    Text("Continue")
                }
            } message: {
                Text(alertMessage)
            }
        }

    }
    func signIn(email: String , password : String){
        Task {
            if let errorText = await authVM.signIn(email: email, password: password) {
                alertMessage = errorText
                showAlert.toggle()
            } else {
                // signed ind
                print("done")
                await schoolData.fetchSchool()
                if let userID = authVM.user?.uid {
                    await schoolData.fetchFavorites(userID: userID)
                }
            }
        }
        
    }
    
    func guest() {
        Task {
            if let errorText = await authVM.signInAnonymously() {
                alertMessage = errorText
                showAlert.toggle()
            } else {
                // signed ind
                await schoolData.fetchSchool()
                if let userID = authVM.user?.uid {
                    await schoolData.fetchFavorites(userID: userID)
                }
            }
        }
        
    }
}
struct SignUP_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

