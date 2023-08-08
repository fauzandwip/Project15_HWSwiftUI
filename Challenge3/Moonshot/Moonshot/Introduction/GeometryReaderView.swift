//
//  GeometryReaderView.swift
//  Moonshot
//
//  Created by Fauzan Dwi Prasetyo on 09/06/23.
//

import SwiftUI

struct GeometryReaderView: View {
    var body: some View {
        GeometryReader { geo in
            Image("aldrin")
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width * 0.8)
                // to make image center
                .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct GeometryReaderView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderView()
    }
}
