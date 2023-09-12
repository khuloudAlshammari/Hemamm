//
//  SwiftUIView.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 16/02/1445 AH.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore

struct SignUpView: View {
   
    @EnvironmentObject var authVM: AuthViewModel
    
    @Environment(\.dismiss) var dismiss
    
    @State var userName :String = ""
    @State var email :String = ""
    @State var pasoword :String = ""
    @State var mylist :String = ""
    
    @State var showAlert : Bool = false
    @State var alertMessage : String = ""
   

    @State var shouldNavigateToNextView: Bool = false
    var body: some View {
        VStack(spacing: -2) {
            Spacer()
            Image("login")
                .resizable()
                .frame(height: 250)
            
            ZStack {
                Rectangle()
                    .frame(height: 550)
                    .foregroundColor(.white)
                    .cornerRadius(50)
                    
                VStack{
                    HStack{
                        Text("Creat New user")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .padding(.trailing,130)
                    }.padding(.top,-18)
                    
                    HStack{
                        Image(systemName: "person")
                        TextField("UserName", text: $userName)
                            .padding(10)
                    }.padding()
                    Divider()
                        .background(Color("Color"))
                        .frame(width: 360)
                    HStack{
                        Image(systemName: "envelope")
                        TextField("Email", text: $email)
                            .padding(10)
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
                        .padding()
                    

                    
                    Button(action: {
                        signUp(userName: userName, email: email, password: pasoword)
                    }, label: {
                        Text("Sign Up")
                            .bold()
                            .frame(width: 160,height: 42)
                        
                           
                        
                    })
                        .background(Color("Color"))
                        .foregroundColor(.white)
                        .cornerRadius(40)
                    
                    Button(
                        action: {
                            dismiss()
                        },
                        label: {
                            Text("Back To Sign In")
                                .foregroundColor(.black)
                                .padding(.trailing, 253)
                        }
                    )
                    .padding(.leading,12)
                }
            }
            .padding(.bottom,-34)
        }
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
        .alert("Error", isPresented: $showAlert) {
            Button(role: .cancel, action: {}) {
                Text("Continue")
            }
        } message: {
            Text(alertMessage)
        }
    }
    
    func signUp(userName: String, email: String , password : String) {
        Task {
            if let errorText = await authVM.signUp(userName: userName, email: email, password: password) {
                alertMessage = errorText
                showAlert.toggle()
            } else {
                // signed ind
                print("done")
            }
        }
    }
}
struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView().navigationBarBackButtonHidden(true)
           
    }
}
