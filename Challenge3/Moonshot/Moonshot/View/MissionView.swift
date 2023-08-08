//
//  MissionView.swift
//  Moonshot
//
//  Created by Fauzan Dwi Prasetyo on 09/06/23.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    var mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
            GeometryReader { geo in
                ScrollView {
                    VStack {
                        // Logo
                        LogoView(mission: mission, geo: geo)
                        // challenge project 15 - Accessibility VoiceOver
                            .accessibilityElement()
                            .accessibilityLabel(mission.formattedLaunchDate)
                        
                        // Mission Highlights
                        VStack(alignment: .leading) {
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(.lightBackground)
                                .padding(.vertical)
                            
                            Text("Mission Highlights")
                                .font(.title.bold())
                                .padding(.bottom, 5)
                            
                            Text(mission.description)
                            
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(.lightBackground)
                                .padding(.vertical)
                            
                            Text("Crew")
                                .font(.title.bold())
                        }
                        // challenge project 15 - Accessibility VoiceOver
                        .accessibilityElement()
                        .accessibilityLabel("Mission Highlights")
                        .accessibilityHint(mission.description)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                        
                    // Crew
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(crew, id: \.role) { crewMember in
                                NavigationLink {
                                    AstronautView(astronaut: crewMember.astronaut)
                                } label: {
                                    CrewMemberView(crewMember: crewMember)
                                    // challenge project 15 - Accessibility VoiceOver
                                        .accessibilityElement()
                                        .accessibilityLabel(crewMember.astronaut.name)
                                        .accessibilityHint(crewMember.role)
                                        .accessibilityAddTraits(.isButton)
                                }
                            }
                        }
                    }
                    .padding(.bottom)
                }
            }
            .navigationTitle(mission.displayName)
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
    }

    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission

        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[5], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
