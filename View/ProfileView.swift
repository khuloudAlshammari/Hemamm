//
//   profile.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 17/02/1445 AH.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    
    @State private var isEditing: Bool = false
    
    @State private var name: String = ""
    @State private var email: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = authVM.user {
                    Image(systemName: "person.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100,height: 100)
                        .padding(30)
                    
                    VStack(alignment: .leading, spacing: 30) {
                        Text("Name :")
                        if isEditing {
                            TextField("Name", text: $name)
                        } else {
                            Text(user.displayName ?? "")
                                .bold()
                                .foregroundColor(.gray)
                        }
                        
                        Divider()
                            .background(Color("Color"))
                        Text("Email :")
                            
                        if isEditing {
                            TextField("Email", text: $email)
                        } else {
                            Text(user.email ?? "")
                                .bold()
                                .foregroundColor(.gray)
                        }
                        
                        Divider()
                            .background(Color("Color"))
                            //HStack{
                            Image("1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 55,height: 55)
                                .padding(.trailing,8)
                       // }.padding(.leading,240)
                    }
                    .padding(20)
                    .frame(width: 330,height:330)
                    .border(Color("Color"))
                }
                
                Link(destination: URL(string: "https://x.com/khuloud_n_sh?s=21&t=HfdbZ3GjZU9cT7_JJV8irQ")!,
                     label: {
                                    HStack(spacing: 200) {
                    
                                        Text("Cunect us ")
                                            .font(.title2)
                    
                                        Button(action: {
                    
                                        }, label: {
                                            Image(systemName: "chevron.right" )
                                        }).buttonStyle(.plain)
                                    }
                                    
                }).foregroundColor(.black)

                
            }
            .onAppear {
                if let user = authVM.user {
                    name = user.displayName ?? ""
                    email = user.email ?? ""
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Menu {
                        Button("Edit", action: {
                            withAnimation {
                                isEditing = true
                            }
                        })
                        Button("Sign Out", role: .destructive, action: {
                            authVM.signOut()
                        })
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .foregroundColor(.black)
                    }
                }
                
                if isEditing {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Save") {
                            Task {
                                await authVM.updateDispalyName(name: name)
                                await authVM.updateEmail(email: email)
                                
                                withAnimation {
                                    isEditing = false
                                }
                                
                            }
                        }
                    }
                }
            }
        }
    }
}

struct _profile_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(AuthViewModel())
    }
}
