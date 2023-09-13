//
//  Favorite.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 20/02/1445 AH.
//

import Foundation
import FirebaseFirestoreSwift

struct Favorite: Codable, Identifiable {
    let id = UUID()
    @DocumentID var docID: String?
    let userID: String
    let name: String
    
    enum CodingKeys: CodingKey {
        case docID
        case userID
        case name
    }
}
