//
//  BeastsScreenVIew.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 04-03-23.
//

import SwiftUI

struct BeastsScreenView: View {
    
    @StateObject private var beastsViewModel = BeastsViewModel()
    @GestureState private var dragOffset: CGFloat = 0
    @State private var offset: CGFloat = 0
    @State private var isOffsetableScrollViewDraggedUp = false
    @State private var isBeastSelected = false
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
                        ForEach(beastsViewModel.beasts, id: \.beastName) { beast in
                            BeastCardView(beastModel: beast, animation: animation)
                                .onTapGesture {
                                    beastsViewModel.selectedBeast = beast
                                    
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        isBeastSelected = true
                                    }
                                }
                        }
                    }
                    .padding(.horizontal, 10)
                }
                .padding(.top, isOffsetableScrollViewDraggedUp ? 199 : 200)
            }
            
            VStack {
                TextStyleView(text: "Beasts", isOffsetableScrollViewDraggedUp: $isOffsetableScrollViewDraggedUp)
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
            if isBeastSelected {
                ZStack {
                    Color("Background").opacity(isBeastSelected ? 1 : 0)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                isBeastSelected = false
                            }
                            
                            withAnimation(.easeInOut(duration: 0.1)) {
                                showContent = false
                            }
                        }
                    
                    BeastExtendedCardView(beastModel: beastsViewModel.selectedBeast, showContent: $showContent, animation: animation)
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
                                            isBeastSelected = false
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
            beastsViewModel.getBeast()
        }
    }
}

struct BeastsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        BeastsScreenView()
    }
}
