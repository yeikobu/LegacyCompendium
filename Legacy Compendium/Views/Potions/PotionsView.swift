//
//  PotionsView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 03-03-23.
//

import SwiftUI

struct PotionsView: View {
    
    @StateObject private var potionsViewModel = PotionsViewModel()
    @State private var isOffsetableScrollViewDraggedUp = false
    private let gridForm = [GridItem(.flexible()), GridItem(.flexible())]
    @Namespace private var animation
    
    var body: some View {
        ZStack {
            BackgroundView()
            
                OffsettableScrollView(showsIndicator: false) { point in
                    if point.y < -20 {
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
                    VStack {
                        LazyVGrid(columns: gridForm) {
                            ForEach(potionsViewModel.potions, id: \.potionName) { potion in
                                PotionCardView(potionModel: potion, animation: animation)
                            }
                        }
                        .padding(.horizontal, 10)
                    }
                    .padding(.top, isOffsetableScrollViewDraggedUp ? 199 : 200)
                }
                
                VStack {
                    TextStyleView(text: "Potions", isOffsetableScrollViewDraggedUp: $isOffsetableScrollViewDraggedUp)
                        .padding(.bottom, 20)
                        .frame(maxWidth: .infinity, alignment: isOffsetableScrollViewDraggedUp ? .center : .leading)
                        .background {
                            if isOffsetableScrollViewDraggedUp {
                                NavBarBackgroundView(isOffsetableScrollViewDraggedUp: $isOffsetableScrollViewDraggedUp)
                            }
                        }
                    
                    Spacer()
                }
                .padding(.top, isOffsetableScrollViewDraggedUp ? 20 : 100)
           
        }
        .onAppear {
            potionsViewModel.getPotions()
        }
    }
}

struct PotionsView_Previews: PreviewProvider {
    static var previews: some View {
        PotionsView()
    }
}
