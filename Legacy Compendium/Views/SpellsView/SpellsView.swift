//
//  HomeView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 24-02-23.
//

import SwiftUI

struct SpellsView: View {
    @StateObject private var spellsViewModel = SpellsViewModel()
    @State private var titleSize: CGFloat = 32
    @State private var isOffsetableScrollViewDraggedUp = false
    private let gridForm = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            OffsettableScrollView(showsIndicator: false) { point in
                if point.y < -10 {
                    withAnimation(.easeOut(duration: 0.3)) {
                        isOffsetableScrollViewDraggedUp = true
                    }
                }
                
                if point.y >= 0 {
                    withAnimation(.easeOut(duration: 0.3)) {
                        isOffsetableScrollViewDraggedUp = false
                    }
                }
            } content: {
                LazyVGrid(columns: gridForm, spacing: 30) {
                    ForEach(spellsViewModel.legacyCompendiumModel.collections.spellsAndCharms, id: \.self) { spells in
                        SpellCardView(imgUrl: spells.img, spellName: spells.spellName, spellType: spells.type, coolDown: spells.cooldown, description: spells.description)
                    }
                }
            }
            
            VStack {
                HStack {
                    TextStyleView(text: "Spells", isOffsetableScrollViewDraggedUp: $isOffsetableScrollViewDraggedUp)
//                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            NavBarBackgroundView(isOffsetableScrollViewDraggedUp: $isOffsetableScrollViewDraggedUp)
                        )
                    
                    Spacer()
                }
                
                Spacer()
            }
            .padding(.top, isOffsetableScrollViewDraggedUp ? 20 : 100)
//            .ignoresSafeArea()
        }
        .onAppear {
//            legacyCompendiumViewModel.getData()
            spellsViewModel.getSpellsByType()
        }
    }
}

struct SpellsView_Previews: PreviewProvider {
    static var previews: some View {
        SpellsView()
    }
}
