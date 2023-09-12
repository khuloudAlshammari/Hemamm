//
//  Page.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 17/02/1445 AH.
//


import Foundation

struct Page: Identifiable, Equatable {
    let id = UUID()
   
    var description: String
   
    var imageUrl: String
    var tag: Int
    
    static var samplePage = Page( description: "This is a sample description for the purpose of debugging", imageUrl: "onb2", tag: 0)
    
    static var samplePages: [Page] = [
        Page( description: "لا تدع الإعاقة تقف في طريق أحلامك", imageUrl: "onb2", tag: 0),
        Page( description: "نساعدك في العثور علئ أفضل المراكز والمدارس لذوي الإعاقة في منطقتك",  imageUrl: "onb3", tag: 1),
        Page( description: "معا يمكننا خلق عالم اكثر شمولـا وشمولية",  imageUrl: "onb", tag: 2),
    ]
}
