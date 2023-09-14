//
//  LocationMapAnnotionView.swift
//  LocationManagerSwiftUI
//
//  Created by Ravikanth Thummala on 9/13/23.
//

import SwiftUI

struct LocationMapAnnotionView: View {
    // MARK: Properties
    let accentColor = Color("AccentColor")
    
    // MARK: Body
    var body: some View {
        VStack(spacing: 0){
        // Map icon with circle background
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30,height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(accentColor)
                .clipShape(Circle())
            
            // trinagle shape below the mapicon
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width: 10,height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom,40)
        }
    }
}

#Preview {
    LocationMapAnnotionView()
}
