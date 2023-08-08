//
//  LogoView.swift
//  Moonshot
//
//  Created by Fauzan Dwi Prasetyo on 10/06/23.
//

import SwiftUI

struct LogoView: View {
    let mission: Mission
    let geo: GeometryProxy
    
    var body: some View {
        Image(decorative: mission.imageName)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: geo.size.width * 0.6)
            .padding(.top)
        
        Text(mission.launchDate?.formatted(date: .long, time: .omitted) ?? "N/A")
            .foregroundColor(.secondary)
            .padding(.top)
    }
}
