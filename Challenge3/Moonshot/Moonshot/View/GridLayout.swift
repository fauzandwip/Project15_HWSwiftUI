//
//  GridLayout.swift
//  Moonshot
//
//  Created by Fauzan Dwi Prasetyo on 10/06/23.
//

import SwiftUI

struct GridLayout: View {
    let astrounauts: [String: Astronaut]
    let missions: [Mission]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astrounauts)
                        } label: {
                            VStack {
                                // challenge project 15 - Accessibility VoiceOver
                                Image(decorative: mission.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.lightBackground)
                            }
                            // challenge project 15 - Accessibility VoiceOver
                            .accessibilityElement()
                            .accessibilityLabel("\(mission.displayName), \(mission.formattedLaunchDate)")
                        }
                    }
                }
                .padding()
            }
    }
}

struct GridLayout_Previews: PreviewProvider {
    static let astrounauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        GridLayout(astrounauts: astrounauts, missions: missions)
            .preferredColorScheme(.dark)
            .background(.darkBackground)
    }
}
