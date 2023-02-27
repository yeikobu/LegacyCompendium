//
//  HomeView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 24-02-23.
//

import SwiftUI

struct SpellsView: View {
    @StateObject private var legacyCompendiumViewModel = LegacyCompendiumViewModel()
    @State private var titleSize: CGFloat = 32
    @State private var isOffsetableScrollViewDraggedUp = false
    @State private var spellsCount = 0
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
                    ForEach(legacyCompendiumViewModel.legacyCompendiumModel.collections.spellsAndCharms, id: \.self) { spells in
                        SpellCardView()
                            .task {
                                print(index)
                            }
                    }
                }
            }
            
            VStack {
                HStack {
                    TextStyleView(text: "Spells", textSize: $titleSize)
                    
                    Spacer()
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 100)
        }
        .onAppear {
            legacyCompendiumViewModel.getData()
            spellsCount = legacyCompendiumViewModel.legacyCompendiumModel.collections.spellsAndCharms.count
        }
    }
}

struct SpellsView_Previews: PreviewProvider {
    static var previews: some View {
        SpellsView()
    }
}
