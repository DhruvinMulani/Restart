//
//  OnbordingView.swift
//  Restart
//
//  Created by Dhruvin Mulani on 2024-02-05.
//

import SwiftUI

struct OnbordingView: View {
    //MARK: property
    
    @AppStorage("onbording") var isOnbordingViewActive: Bool = true
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea (.all, edges: .all)
            VStack(spacing:20){
                //MARK:- Header
                Spacer()
                
                VStack(spacing:0){
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("""
                    It's not hopw much we give but
                    how much love we put into giving.
                    """)
                        .font(.title3)
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.horizontal,10)
                }
                
                //MARK:- Center
                
                ZStack{
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.20)
                   //: ZSTACK
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                                    }//: Center
                
                Spacer()
                //MARK:- Footer
                
                ZStack{
                    //1. Background (Static)
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))  
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    //2. call-to-action (Static)
                    
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x:20)
                    //3. capsule (dynamic width)
                    
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: 80)
                        
                        Spacer()
                    }
                    //4. circle (draggable)
                    
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed")) 
                            
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size:24, weight: .bold))
                            
                        }
                        .foregroundColor(.white)
                    .frame(width: 80,height: 80,alignment: .center)
                    .onTapGesture {
                        isOnbordingViewActive=false
                    }
                        
                        Spacer()
                    }
                    
                    
                    
                }//:Footer
                .frame(height: 80, alignment: .center)
                .padding()
            }//:Vstack
        }//:Zstack
    }
}

#Preview {
    OnbordingView()
}
