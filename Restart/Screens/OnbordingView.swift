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
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width-80
    @State private var buttonOffSet: CGFloat = 0
    @State private var isAnimating: Bool = true
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
    @State private var textTitle: String = "Share."
    
    var body: some View {
        
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea (.all, edges: .all)
            VStack(spacing:20){
                //MARK: - Header
                Spacer()
                
                VStack(spacing:0){
                    Text(textTitle)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .transition(.opacity)
                        .id(textTitle)
                    
                    Text("""
                    It's not hopw much we give but
                    how much love we put into giving.
                    """)
                    .font(.title3)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal,10)
                }//:header
                .opacity(isAnimating ? 1 : 0 )
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                //MARK: - Center
                
                ZStack{
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.20)
                        .offset(x:imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width/5))
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    //: ZSTACK
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .offset(x: imageOffset.width * 1.2, y : 0)
                        .rotationEffect(.degrees(Double(imageOffset.width/20)))                        .gesture(DragGesture()
                            .onChanged{ gesture in
                                if abs(imageOffset.width) <= 150 {
                                    imageOffset = gesture.translation
                                    
                                    withAnimation(.linear(duration: 0.25)){
                                        indicatorOpacity = 0
                                        textTitle = "Give."
                                    }
                                }
                            }
                            .onEnded{ _  in
                                imageOffset = .zero
                                withAnimation(.linear(duration:  0.25)) {
                                    indicatorOpacity = 1
                                    textTitle = "Share."
                                }
                            }
                        )
                        .animation(.easeOut(duration: 1), value: imageOffset)
                }//: Center
                .overlay(
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44,weight: .ultraLight))
                        .foregroundColor(.white)
                        .offset(y:20)
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 1).delay(5),value: isAnimating)
                        .opacity(indicatorOpacity)
                    ,alignment: .bottom)
                
                Spacer()
                //MARK: - Footer
                
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
                            .frame(width: buttonOffSet + 80)
                        
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
                        .offset(x:buttonOffSet)
                        .gesture(
                            DragGesture()
                                .onChanged{gesture in
                                    if gesture.translation.width > 0 && buttonOffSet <=
                                    buttonWidth - 80{
                                        buttonOffSet = gesture.translation.width
                                    }
                                }
                                .onEnded{ _ in
                                    withAnimation(Animation.easeOut(duration: 0.4)){
                                        if buttonOffSet > buttonWidth / 2{
                                            buttonOffSet = buttonWidth - 80
                                            isOnbordingViewActive = false
                                        }
                                        else{
                                            buttonOffSet = 0}
                                    }
                                    }
                            )//: Gesture
                                Spacer()
                    }
                    }//:Footer
                    .frame(width: buttonWidth,height: 80, alignment: .center)
                    .padding()
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y:isAnimating ? 0 : 40)
                    .animation(.easeOut(duration: 1), value: isAnimating)
                                   }//:Vstack
            }//:Zstack
          .onAppear(perform: {
            isAnimating = true
            
        })
        }
    }


#Preview {
    OnbordingView()
}
