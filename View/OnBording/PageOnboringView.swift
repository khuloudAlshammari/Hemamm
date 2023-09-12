//
//  PageOnboringView.swift
//  FinalprojectHumm
//
//  Created by khuloud alshammari on 17/02/1445 AH.
//
import SwiftUI

struct PageOnboringView: View {
    @State private var pageIndex = 0
    private let pages: [Page] = Page.samplePages
    @State var showaleart : Bool = false
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        
        TabView(selection: $pageIndex) {
            ForEach(pages) { page in
                VStack {
                    Spacer()
                    PageView(page: page)
                    Spacer()
                    if page == pages.last {
                   
    
                    } else {
                     
                                                   //.buttonStyle(.borderedProminent)
                        
                    }
                    Spacer()
                }
                .tag(page.tag)
            
            }
        
        }
        .padding(.bottom,70)
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
            
        .animation(.easeInOut, value: pageIndex)// 2
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .tabViewStyle(PageTabViewStyle())
        .onAppear {
            dotAppearance.currentPageIndicatorTintColor = .blue
            dotAppearance.pageIndicatorTintColor = .white
        }
       
    }//BODY
    
    func incrementPage() {
        pageIndex += 1
    }
    
    func goToZero() {
        pageIndex = 0
       
    }
}

struct PageOnboringView_Previews: PreviewProvider {
    static var previews: some View {
        PageOnboringView()
    }
}
