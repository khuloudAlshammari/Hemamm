//
//  Test.swift
//  FinalprojectHumm
//
////  Created by khuloud alshammari on 19/02/1445 AH.
////
//
//import SwiftUI
//import FirebaseStorage
//import FirebaseFirestore
//
//struct UploudDataFireStore: View {
//    
//    var scoldata =  DataSchoolVM()
//   
//    var body: some View {
//        VStack{
//            Button(action: {
////                scoldata.uploadBootcampsToFirestore(schools: <#[SchoolJasonData]#>)
//           print("done")
//            }, label: {
//                Text("send")
//            })
//        }
////        .onAppear{
////            if let content = try? String(contentsOf: Bundle.main.url(forResource: "schools",
////                                                                     withExtension: "json")!, encoding: .utf8)
////            {
////                if let data = content.data(using: String.Encoding.utf8) {
////                    do {
////                        let decoder = JSONDecoder ( )
////                        let ScoolData = try decoder.decode(Array<SchoolJasonData>.self, from: data)
////                        print (ScoolData)
////                        
////                        uploadBootcampsToFirestore(ScoolData)
////                        
////                    }
////                    catch {
////                        print(error)
////                    }
////                    
////                }
////            }
////
////        }
//
//    
//    }
//    //Send all Data  for Firebase
////
////    func uploadBootcampsToFirestore(_ schools: [SchoolJasonData]) {
////        let db = Firestore.firestore()
////
////        print("recived \(schools.count) schools")
////
////        for school in schools {
////            do{
////                let  schoolsData: [String: Any] = [
////                    "title": school.title,
////                    "rating": school.rating ?? "",
////                    "reviews":school.reviews ?? "",
////                    "type":school.type ?? "",
////                    "address":school.address ?? "",
////                    "website": school.website ?? "",
////                    "description":school.description ?? "",
////                    "serviceOptions":school.serviceOptions ?? "",
////
////                ]
////
////                db.collection("Schools").addDocument(data: schoolsData) { error in
////                    if let error = error {
////                        print("Error adding document: \(error)")
////                    } else {
////                        print("Document added successfully.")
////                    }
////                }
////
////            }catch{
////                print("Document added successfully.")
////
////            }
////        }
////    }
////
//
//
//
////
////
////
////
////
////
//   
//    // fetch all data for Firebase
//   
//}
//
//struct UploudDataFireStore_Previews: PreviewProvider {
//    static var previews: some View {
//        UploudDataFireStore()
//    }
//}

