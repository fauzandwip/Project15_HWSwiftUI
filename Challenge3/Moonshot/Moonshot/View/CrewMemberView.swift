//
//  CrewMemberView.swift
//  Moonshot
//
//  Created by Fauzan Dwi Prasetyo on 10/06/23.
//

import SwiftUI

struct CrewMemberView: View {
    let crewMember: MissionView.CrewMember
    
    var body: some View {
        HStack(spacing: 10) {
            Image(decorative: crewMember.astronaut.id)
                .resizable()
                .frame(width: 104, height: 72)
                .clipShape(Capsule())
                .overlay {
                    Capsule()
                        .strokeBorder(.white, lineWidth: 1)
                }
            
            VStack(alignment: .leading) {
                Text(crewMember.astronaut.name)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(crewMember.role)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.horizontal)
    }
}
