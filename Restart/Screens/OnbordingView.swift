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
        VStack {
            Text("Onbording")
                .font(.largeTitle)
            
            Button(action:{
isOnbordingViewActive = false
            }) {
                Text("Start")
            }
        }
    }
}

#Preview {
    OnbordingView()
}
