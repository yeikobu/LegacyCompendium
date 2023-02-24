//
//  HomeView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 24-02-23.
//

import SwiftUI

struct SpellsView: View {
    @State var titleSize: CGFloat = 32
    var homeAnimation: Namespace.ID
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                HStack {
                    TextStyleView(text: "Spells", textSize: $titleSize)
                        .matchedGeometryEffect(id: "Spells", in: homeAnimation)
                    
                    Spacer()
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 100)
        }
    }
}

struct SpellsView_Previews: PreviewProvider {
    
    @Namespace static var animation
    
    static var previews: some View {
        SpellsView(homeAnimation: animation)
    }
}
