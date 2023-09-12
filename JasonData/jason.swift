//
//  jason.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 19/02/1445 AH.
//
//
//import SwiftUI
//
//struct jason: View {
//    var body: some View {
//        VStack{
//            //schools.json
//        }.onAppear{
//            
//            if let content = try? String(contentsOf:Bundle.main.url(forResource: "schools", withExtension: "json")!,encoding: .utf8) {
//        
//   
//                if let data = content.data(using:String.Encoding.utf8){
//                    do {
//                        let decoder = JSONDecoder ()
//                        let jsonScol = try
//                        decoder.decode (Array<SchoolJasonData>.self, from:data)
//                        print (jsonScol)
//                    } catch {
//                        print ("Decoding Eror ",error)
//                    }
//                    
//                }
//          
//            }
//            
//            
//            
//        }
//    }
//}
//
//struct jason_Previews: PreviewProvider {
//    static var previews: some View {
//        jason()
//    }
//}
