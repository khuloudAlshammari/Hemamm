//
//  OnbordingView.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 26/02/1445 AH.
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding var didOnboard: Bool
    
    private let onBordingsteps = [
        OnBordingStep(image: "onb1", title: NSLocalizedString("onb1", comment: "")),
        OnBordingStep(image: "onb2", title: NSLocalizedString("onb2", comment: "")),
        OnBordingStep(image: "onb3", title: NSLocalizedString("onb3", comment: ""))

    ]
    
    @State private var currentStep = 0
    @State private var isPresentSignWithApple = false
 
    var body: some View {
        
        ZStack {
            
            VStack {
                HStack{
                    Spacer()
                    Button(action: {
                        self.currentStep = onBordingsteps.count - 1
                    })
                    {
                        
                    }
                }
                TabView(selection: $currentStep){
                    ForEach(0..<onBordingsteps.count) { it in
                        VStack {
                            Image(onBordingsteps[it].image)
                            
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                               // .frame(width: 300,height: 300 )
                            
                            Text(onBordingsteps[it].title)
                                .multilineTextAlignment(.center)
                            
                                .font(.title)
                                .bold()
                                .foregroundColor(.black)
                            
                        }
                        .tag(it)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                HStack{
                    ForEach(0..<onBordingsteps.count) { it in
                        if it == currentStep {
                            Rectangle()
                                .frame(width: 20,height: 10)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        } else {
                            Circle()
                                .frame(width: 10 , height: 10)
                                .foregroundColor(Color("Color"))
                        }
                    }
                }
                .padding(.bottom,24)
                
                Button(
                    action: {
                        if self.currentStep < onBordingsteps.count - 1 {
                            self.currentStep += 1
                        } else {
                            // SignWithApple
                            withAnimation {
                                didOnboard.toggle()
                            }
 
                        }
                    },
                    label: {
                        Text(currentStep < onBordingsteps.count - 1 ? "Next" : "GetStarted")
                            .padding(16)
                            .frame(width: 250 , height: 44)
                            .background(
                                Rectangle()
                                    .foregroundColor(Color("Color")))//لون البوتن
                            .cornerRadius(16)
                            .padding(.horizontal,16)
                            .foregroundColor(Color.white)
                        
                    }
                )
                .padding(.bottom,50)
                .buttonStyle(PlainButtonStyle())
            }
         //اناهينا ارسلته بنفيقشن لينك
            NavigationLink(
                isActive: $isPresentSignWithApple,
                destination: {
                    SignUpView().navigationBarBackButtonHidden(true)
                },
                label: {}
            )
          
        }
        .edgesIgnoringSafeArea(.all)
        .background(
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.15, green: 0.47, blue: 0.7), location: 0.00),
                    Gradient.Stop(color: .white.opacity(0), location: 0.58),
                    Gradient.Stop(color: Color(red: 0.2, green: 0.6, blue: 0.86).opacity(0.3), location: 1.00),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
        )
    }
}

struct OnbordingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(didOnboard: .constant(false))
    }
}
