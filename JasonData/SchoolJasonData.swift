//
//  ModelData.swift
//  FinalprojectHumm
////
////  Created by khuloud alshammari on 19/02/1445 AH.
//
//
//import Foundation
//
//struct SchoolJasonData: Codable , Identifiable {
//    let id: UUID = UUID()
//    let title: String
//    let rating, reviews, type: String?
//    let address: String?
//    let website: String?
//    let description, serviceOptions: String?
//    let gpsCoordinates: GpsCoordinates
//    let placeURL: String?
//    let dataID: String?
//
//    enum CodingKeys: String, CodingKey {
//        case title, rating, reviews, type, address, website, description, serviceOptions, gpsCoordinates
//        case placeURL = "placeUrl"
//        case dataID = "dataId"
//    }
//}
//
//// MARK: - GpsCoordinates
//struct GpsCoordinates: Codable {
//    let latitude, longitude: String
//}
