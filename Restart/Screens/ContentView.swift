//
//  ContentView.swift
//  Restart
//
//  Created by Dhruvin Mulani on 2024-02-05.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onbording") var isOnbordingViewActive: Bool = true
    
    
    var body: some View {
        ZStack{
            if isOnbordingViewActive{
                OnbordingView()
            }else{
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
