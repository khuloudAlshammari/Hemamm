//
//  Splash.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 18/02/1445 AH.
//
import SwiftUI

struct SplashScreenView: View {
    
    @Binding var didSplash: Bool
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        ZStack {
            Image("splas")
                .resizable()
                .frame(width: 300,height: 300)
               
                .onAppear {
                  withAnimation(.easeIn(duration: 2)) { self.size = 0
                        self.opacity = 0
                    }
                }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    didSplash.toggle()
                }
            }
        }
        
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView(didSplash: .constant(false))
    }
}
