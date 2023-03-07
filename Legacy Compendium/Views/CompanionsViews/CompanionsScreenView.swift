//
//  CompanionsScreenView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 06-03-23.
//

import SwiftUI

struct CompanionsScreenView: View {
    
    @StateObject private var companionsViewModel = CompanionsViewModel()
    @State private var isOffsetableScrollViewDraggedUp = false
    @State private var isCompanionSelected = false
    @State private var showContent = false
    @Namespace private var animation
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
                VStack {
                    LazyVGrid(columns: gridForm) {
                        ForEach(companionsViewModel.companios, id: \.self) { companion in
                            CompanionCardView(companionModel: companion, animation: animation)
                                .onTapGesture {
                                    companionsViewModel.selectedCompanion = companion

                                    withAnimation(.easeOut(duration: 0.3)) {
                                        isCompanionSelected = true
                                    }
                                }
                        }
                    }
                    .padding(.horizontal, 10)
                }
                .padding(.top, isOffsetableScrollViewDraggedUp ? 200 : 200)
            }
            
            VStack {
                TextStyleView(text: "Companions", isOffsetableScrollViewDraggedUp: $isOffsetableScrollViewDraggedUp)
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
            if isCompanionSelected {
                ZStack {
                    GeometryReader {
                        let safeArea = $0.safeAreaInsets
                        let size = $0.size
                        
                        CompanionExtendedCardView(companionModel: companionsViewModel.selectedCompanion, showContent: $showContent, isCompanionSelected: $isCompanionSelected, animation: animation, safeArea: safeArea, size: size)
                    }
                }
            }
        }
        .onAppear {
            companionsViewModel.getCompanion()
        }
    }
}

struct CompanionsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        CompanionsScreenView()
    }
}
