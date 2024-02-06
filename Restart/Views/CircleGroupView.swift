//
//  CircleGroupView.swift
//  Restart
//
//  Created by Dhruvin Mulani on 2024-02-05.
//

import SwiftUI

struct CircleGroupView: View {
    //MARK: property
   
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    
    
    //MARK: Body
    
    var body: some View {
     
        
        ZStack{
            
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity),lineWidth: 40)
                .frame(width: 260,height: 260,alignment: .center)
            
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity),lineWidth: 80)
                .frame(width: 260,height: 260,alignment: .center)
        }
    }
}

#Preview {
    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
}
