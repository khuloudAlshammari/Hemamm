//
//  SchoolType.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 26/02/1445 AH.
//

import SwiftUI

enum SchoolType: String, Codable, CaseIterable {
    case autism
    case intellectual
    case audio
    case visual
    
    var color: Color {
        switch self {
        case .autism: return .yellow.opacity(0.8)
        case .intellectual: return .blue.opacity(0.8)
        case .audio: return .green.opacity(0.8)
        case .visual: return .red.opacity(0.8)
        }
    }
    
    var title: String {
        switch self {
        case .autism: return "Autism"
        case .intellectual: return "Intellectual"
        case .audio: return "Audio"
        case .visual: return "Visual"
        }
    }
}
