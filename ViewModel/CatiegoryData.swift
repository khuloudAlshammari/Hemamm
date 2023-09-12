//
//  CatiegoryData.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 20/02/1445 AH.

//
//import SwiftUI
//
//struct CatiegoryVM: View {
//    //    المفترض يعطي نفس نتيجة السكول تايب
//    //ملاحظة هذا اللوجيك مايشتغل
//    @EnvironmentObject var vm : DataSchoolVM
//    let column = [
//        GridItem(),
//        GridItem()
//    ]
//    @State var  filtterCard : Array<SchoolData> = []
//
//    @State var title: String = "SchoolRiyadh"
//
//    var Autism: Array<SchoolData> {vm.allSchools.filter({
//        card in  card.type == "Autism"
//    })}
//    var deafEndDumb: Array<SchoolData> {vm.allSchools.filter({
//        card in  card.type == "deafEndDumb"
//    })}
//    var Downs: Array<SchoolData> {vm.allSchools.filter({
//        card in  card.type == "Downs"
//    })}
//    var blind: Array<SchoolData> {vm.allSchools.filter({
//        card in  card.type == "blind"
//    })}
//
//
//    var body: some View {
//
//        //        VStack{
//        //scrool
//        ScrollView{
//            LazyVGrid(columns : column ,spacing: 10){
//               ForEach(arryType) { item in
//                    Button(
//                        action: {
//                          title = item.nameType
//                            switch item.nameType {
//                            case "Autism":
//                                filtterCard =  Autism
//                            case "deafEndDumb" :
//                                filtterCard = deafEndDumb
//                            case "blind":
//                                filtterCard = blind
//                            case"Downs" :
//                                filtterCard = Downs
//
//                            default:
//                                filtterCard = vm.allSchools
//                                title = "RiyadhScools"
//
//                            }
//                            print("i am here", Downs)
//                        }, label: {
//                           Text(item.nameType)
//                                .foregroundColor(.white)
//                                .font(.title)
//                        })   .font(.title2)
//                       .foregroundColor(item.color)
//                        .frame(width: 200,height:124)
//
//
//                        .cornerRadius(12)
//
//               }
//
//
//            }
//            //            }
//
//
//        }
//
//        //hstack
//
//        //    }
//
//
//    }}
//
//struct CatiegoryVM_Previews: PreviewProvider {
//    static var previews: some View {
//        CatiegoryVM()
//    }
//}
