//
//  data.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 20/02/1445 AH.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift



class DataSchoolVM: ObservableObject {
   
    @Published var allSchools = [SchoolData]()
    public var userList: [Favorite] = []
    
    @MainActor
    func fetchSchool() async {
        let db = Firestore.firestore()
        do {
            let snapshot = try await db.collection("SchoolRiyad").getDocuments()
            if snapshot.count != 0 {
                self.allSchools = try snapshot.documents.map { try $0.data(as: SchoolData.self) }
            }
        } catch {
            print(error)
        }
    }
    
    @MainActor
    func fetchFavorites(userID: String) async {
        let db = Firestore.firestore()
        do {
            let snapshot = try await db.collection("favorites")
                .whereField("userID", isEqualTo: userID)
                .getDocuments()
            if snapshot.count != 0 {
                self.userList = try snapshot.documents.map { try $0.data(as: Favorite.self) }
            }
            
        } catch {
            print(error)
        }
    }
    
    @MainActor
    func addFavorite(userID: String, name: String) async {
        let db = Firestore.firestore()
        do {
            var favorite = Favorite(userID: userID, name: name)
            let docRef = try await db.collection("favorites")
                .addDocument(data: [
                    "userID": favorite.userID,
                    "name": favorite.name])
            favorite.docID = docRef.documentID
            userList.append(favorite)
        } catch {
            print(error)
        }
    }
    
    @MainActor
    func removeFavorite(favorite: Favorite) async {
        let db = Firestore.firestore()
        do {
            guard let docID = favorite.docID else { return }
            try await db.collection("favorites")
                .document(docID).delete()
            userList.removeAll { $0.docID == docID }
        } catch {
            print(error)
        }
    }
    
    public func isFavorite(name: String) -> Bool {
        userList.contains {
            $0.name == name
        }
    }
    
    public func getFavorite(name: String) -> Favorite? {
        userList.first {
            $0.name == name
        }
    }
    
    // fetch favorites
    // add favorite
    // remove favorite
    
  
}//class






