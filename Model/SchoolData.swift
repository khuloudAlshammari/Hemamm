//
//  CardCatagory.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 20/02/1445 AH.
//

import Foundation
import SwiftUI

struct SchoolData: Codable , Identifiable {
    var id: UUID = UUID()
    var name: String
    var type: SchoolType
    var lok : String
   var web: String
    var desc: String
    var star : String
   var number : String

    enum CodingKeys: CodingKey {
        case name
        case type
        case lok
        case web
        case desc
        case star
        case number
    }
  
}


