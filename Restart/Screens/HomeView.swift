//
//  HomeView.swift
//  Restart
//
//  Created by Dhruvin Mulani on 2024-02-05.
//

import SwiftUI

struct HomeView: View {
    //MARK: property

    @AppStorage("onbording") var isOnbordingViewActive: Bool = false
    @State private var isAnimating :Bool = false

    var body: some View {
        VStack(spacing:20){
           
            //MARK:- Header
            Spacer()
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y:isAnimating ? 75 : -75)
               
                    .animation(
                        Animation
                            .easeOut(duration: 4)
                            .repeatForever()
                        , value: isAnimating
                    )
            }
            
                
            //MARK:- Center
            Text("The time that leads to mastery is dependent on the intensity of our foucs.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            //MARK:- Footer
            Spacer()
            Button(action: {
                withAnimation{
                    playSound(sound: "success", type: "m4a")
                    isOnbordingViewActive = true
                }
            }){
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }//: Button
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            
            
        }//:Vstack
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                isAnimating = true
            })
        })
    }
}

#Preview {
    HomeView()
}
