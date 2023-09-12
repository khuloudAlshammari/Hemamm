//
//  AuthViewModel.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 26/02/1445 AH.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published public var user: User?
    
    public func checkSignIn() {
//        try! Auth.auth().signOut()
//        return
        if let user = Auth.auth().currentUser {
            self.user = user
        }
    }
    
    public func signOut() {
        do {
            try Auth.auth().signOut()
            DispatchQueue.main.async {
                self.user = nil
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @MainActor
    public func signInAnonymously() async -> String? {
        do {
            let result = try await Auth.auth().signInAnonymously()
            user = result.user
            return nil
        } catch {
            return error.localizedDescription
        }
    }
    
    @MainActor
    public func signIn(email: String , password : String) async -> String? {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            
            let changeRequest = user?.createProfileChangeRequest()
            changeRequest?.displayName = "username"
            try await changeRequest?.commitChanges()
            user = result.user
            return nil
        } catch {
            return error.localizedDescription
        }
    }
    
    @MainActor
    public func signUp(userName : String ,email : String, password : String ) async -> String? {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = userName
            try await changeRequest?.commitChanges()
            user = result.user
            return nil
        } catch {
            return error.localizedDescription
        }
    }
    
    @MainActor
    public func updateDispalyName(name : String) async -> String? {
        do {
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = name
            try await changeRequest?.commitChanges()
            return nil
        } catch {
            return error.localizedDescription
        }
    }
    
    @MainActor
    public func updateEmail(email : String) async -> String? {
        do {
            try await Auth.auth().currentUser?.updateEmail(to: email)
            return nil
        } catch {
            return error.localizedDescription
        }
    }
}
