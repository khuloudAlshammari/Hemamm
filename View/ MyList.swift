//
//   MyList.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 17/02/1445 AH.
//

import SwiftUI

struct MyList: View {
   
    var body: some View {
        ScrollView{
            //احتاج احط انتقال للتفاصيل من هينا
            ZStack{
                
                Image("sc")
                    .resizable()
                    .frame(height: 160)
                    .cornerRadius(12)
                    .aspectRatio(contentMode: .fit)
                
                    .padding(20)
                    .shadow(color: Color("Color"),radius: 1.2)
                VStack{
                    Text("Name School")
                        .bold()
                        .foregroundColor(.black)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    
                }
                
                
            }
            Spacer()
        }
              
           
        .padding()
         
    }
}

struct _MyList_Previews: PreviewProvider {
    static var previews: some View {
        MyList()
    }
}
