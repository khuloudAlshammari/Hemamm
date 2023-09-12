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



class DataSchoolVM: ObservableObject{
   
    @Published var allSchools = [SchoolData]()
    
    @MainActor
    func fethSchool() async {
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
    
    
  
}//class






