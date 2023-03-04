//
//  PotionsView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 03-03-23.
//

import SwiftUI

struct PotionsView: View {
    
    @StateObject private var potionsViewModel = PotionsViewModel()
    @GestureState private var dragOffset: CGFloat = 0
    @State private var offset: CGFloat = 0
    @State private var isOffsetableScrollViewDraggedUp = false
    @State private var isPotionCardSelected = false
    @State private var showContent = false
    @Namespace private var animation
    private let gridForm = [GridItem(.flexible()), GridItem(.flexible())]
    
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
                                .onTapGesture {
                                    potionsViewModel.selectedPotion = potion
                                    
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        isPotionCardSelected = true
                                    }
                                }
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
        .overlay(alignment: .center) {
            if isPotionCardSelected {
                ZStack {
                    Color("Background").opacity(isPotionCardSelected ? 1 : 0)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                isPotionCardSelected = false
                            }
                            
                            withAnimation(.easeInOut(duration: 0.1)) {
                                showContent = false
                            }
                        }
                    
                    PotionExtendedCardView(potionModel: potionsViewModel.selectedPotion, showContent: $showContent, animation: animation)
                        .offset(y: offset + dragOffset)
                        .gesture(
                            DragGesture()
                                .updating($dragOffset) { value, state, _ in
                                    state = value.translation.height
                                }
                                .onEnded { value in
                                    let screenHeight = UIScreen.main.bounds.height
                                    let swipeThreshold = screenHeight * 0.10
                                    
                                    if value.translation.height > swipeThreshold {
                                        withAnimation(.easeInOut(duration: 0.3)) {
                                            isPotionCardSelected = false
                                        }
                                        
                                        
                                        withAnimation(.easeInOut(duration: 0.1)) {
                                            showContent = false
                                        }
                                        
                                        withAnimation {
                                            offset = screenHeight
                                        }
                                    } else {
                                        withAnimation {
                                            offset = 0
                                        }
                                    }
                                }
                        )
                }
                .transition(.offset(x: 1, y: 1))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .onDisappear {
                    offset = 0
                }
                .ignoresSafeArea()
            }
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
