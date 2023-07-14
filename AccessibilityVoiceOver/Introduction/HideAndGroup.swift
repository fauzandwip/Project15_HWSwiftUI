//
//  HideAndGroup.swift
//  AccessibilityVoiceOver
//
//  Created by Fauzan Dwi Prasetyo on 13/07/23.
//

import SwiftUI

struct HideAndGroup: View {
    var body: some View {
            VStack {
                Image(decorative: "character") // don't read image name
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 500)
                // invisible from accessibility (useful for hidden elements)
                    .accessibilityHidden(true)
                Spacer()
                
                // will read “Your Score is” or “1000”
                VStack {
                    Text("Your Score is")
                    Text("1000")
                        .font(.title)
                }
                Spacer()
                
                // will read “Your Score is” delay then “1000” (pause between children)
                VStack {
                    Text("Your Score is")
                    Text("1000")
                        .font(.title)
                }
                .accessibilityElement(children: .combine)
                Spacer()
                
                // will ignore children
                // will read "Your Score is 1000"
                VStack {
                    Text("Your Score is")
                    Text("1000")
                        .font(.title)
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("Your Score is 1000")
            }
    }
}

struct HideAndGroup_Previews: PreviewProvider {
    static var previews: some View {
        HideAndGroup()
    }
}
