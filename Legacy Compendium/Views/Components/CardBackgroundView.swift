//
//  CardBackgroundView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 24-02-23.
//

import SwiftUI

struct CardBackgroundView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(.ultraThinMaterial)
                .blur(radius: 0)
                .opacity(0.85)
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(Color("Card"))
                .blur(radius: 0)
                .opacity(0.80)
        }
    }
}

struct CardBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        CardBackgroundView()
    }
}
