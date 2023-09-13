//
//   profile.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 17/02/1445 AH.
//

import PhotosUI
import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    @EnvironmentObject var schoolData: DataSchoolVM
    
    @State private var selectedImageItem: PhotosPickerItem?
    @State private var selectedImage: UIImage?
    
    @State private var isEditing: Bool = false
    @State private var networking: Bool = false
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            if let user = authVM.user {

                VStack {
                    VStack {
                        if isEditing {
                            PhotosPicker(selection: $selectedImageItem, matching: .images) {
                                if let url = user.photoURL {
                                    AsyncImage(url: url) { img in
                                        img
                                            .resizable()
                                            //.aspectRatio(contentMode:.fit)
                                            .frame(width:150,height: 150)
                                            .cornerRadius(25)
                                            //.padding(30)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                } else {
                                    Image("kkk")
                                        .resizable()
                                        .aspectRatio(contentMode:.fit)
                                        .frame(width:150,height: 150)
                                        .cornerRadius(50)
//                                        .padding(30)
                                }
    
                            }
                            .disabled(networking)
                        } else {
                            if let url = user.photoURL {
                                AsyncImage(url: url) { img in
                                    img
                                        .resizable()
                                        //.aspectRatio(contentMode:.fit)
                                        .frame(width:150,height: 150)
                                        .cornerRadius(25)
//                                        .padding(30)
                                } placeholder: {
                                    ProgressView()
                                }
                            } else {
                                Image("kkk")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150,height: 150)
                                    .padding(30)
                            }
                        }
                    }
                    .frame(height: 180)
                    
                    Form {
                        
                        LabeledContent("Name") {
                            if isEditing {
                                TextField("Name", text: $name)
                            } else {
                                Text(user.displayName ?? "")
                            }
                        }
                        
                        LabeledContent("Email") {
                            if isEditing {
                                TextField("Email", text: $email)
                            } else {
                                Text(user.email ?? "")
                            }
                        }
                        
                        if user.isAnonymous && isEditing {
                            LabeledContent("Name") {
                                SecureField("Pasoword", text: $password)
                            }
                        }
                        
                        
                        Section {
                            Link(destination: URL(string: "https://x.com/khuloud_n_sh?s=21&t=HfdbZ3GjZU9cT7_JJV8irQ")!) {
                                Text("Contact Us")
                                    .bold()
                            }
                            
                            Link(destination: URL(string: UIApplication.openSettingsURLString)!) {
                                Text("ChangeLanguage")
                                    .bold()
                            }
                        }
                        
                        Image("1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 55,height: 55)
                            .padding(.trailing,8)
                        
                    }
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
                            Button("SignOut", role: .destructive, action: {
                                authVM.signOut()
                                schoolData.userList = []
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
                                    if let user = authVM.user {
                                        if user.isAnonymous {
                                            await authVM.upgrade(userName: name, email: email, password: password)
                                        } else {
                                            await authVM.updateDispalyName(name: name)
                                            await authVM.updateEmail(email: email)
                                        }
                                    }
                                    
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
        .onChange(of: selectedImageItem) { _ in
            Task {
                if let data = try? await selectedImageItem?.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        selectedImage = uiImage
                        uploadImage()
                        return
                    }
                }
                
                print("Failed")
            }
        }
        .toolbarBackground(.visible, for: .tabBar)
    }
    
    private func uploadImage() {
        Task {
            networking = true
            if let image = selectedImage {
                if let url = await authVM.uploadImage(uiImage: image) {
                    _ = await authVM.updatePhoto(url: url)
                }
            }
            networking = false
        }
    }
}

struct _profile_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(AuthViewModel())
    }
}




/*
 users
 - id
 - username
 - email
 - sldfkjslkgj
 - id
 - id
 - id
 - id
 - id
 - id
 
 
 */
