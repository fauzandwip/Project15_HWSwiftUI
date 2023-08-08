//
//  ListLayout.swift
//  Moonshot
//
//  Created by Fauzan Dwi Prasetyo on 10/06/23.
//

import SwiftUI

struct ListLayout: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(missions) { mission in
                    ZStack {
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            EmptyView()
                        }
                        .opacity(0)
                        
                        // cell
                        HStack {
                            // challenge project 15 - Accessibility VoiceOver
                            Image(decorative: mission.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100,height: 100)
                                .padding()
//                                .background(.lightBackground)
                            
                            HStack {
                                Spacer()
                                
                                VStack(spacing: 5) {
                                    Text(mission.displayName)
                                        .font(.title2.bold())
                                    
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                            }
                            .frame(height: 100)
                            .padding()
                            .background(.lightBackground)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay {
                            RoundedRectangle(cornerRadius: 40)
                                .strokeBorder(.lightBackground, lineWidth: 2)
                        }
                        // challenge project 15 - Accessibility VoiceOver
                        .accessibilityElement()
                        .accessibilityLabel("\(mission.displayName), \(mission.formattedLaunchDate)")
                    }
                }
                .listRowBackground(Color.darkBackground)
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
    }
    
    init(astronauts: [String : Astronaut], missions: [Mission]) {
        self.astronauts = astronauts
        self.missions = missions
        
        UITableView.appearance().separatorStyle = .none
    }
}

struct ListLayout_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        ListLayout(astronauts: astronauts, missions: missions)
            .preferredColorScheme(.dark)
            .background(.darkBackground)
    }
}
