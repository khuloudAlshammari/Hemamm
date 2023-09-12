//
//  PageViwe.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 17/02/1445 AH.
//
import SwiftUI

struct PageView: View {
    var page: Page
    
    var body: some View {

            VStack(spacing: 10) {
                Image("\(page.imageUrl)")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .cornerRadius(30)
                    
                    .cornerRadius(10)
                    .padding()
                
                
                Text(page.description)
                    .font(.title2)
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
             
                
                
                   
            }
            
       
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(page: Page.samplePage)
    }
}
