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

    var body: some View {
        VStack(spacing: 20){
        
            Text("Home")
                .font(.largeTitle)
            
            Button(action: {
                isOnbordingViewActive=true
            }) {
                Text("Restart")
            }
        }
    }
}

#Preview {
    HomeView()
}
