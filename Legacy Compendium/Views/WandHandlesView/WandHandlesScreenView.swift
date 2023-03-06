//
//  WandHandlesScreenView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 05-03-23.
//

import SwiftUI

struct WandHandlesScreenView: View {
    
    @StateObject private var wandHandleViewModel = WandHandlesViewModel()
    @GestureState private var dragOffset: CGFloat = 0
    @State private var offset: CGFloat = 0
    @State private var isOffsetableScrollViewDraggedUp = false
    @State private var isBroomSelected = false
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
                    VStack {
                        ForEach(wandHandleViewModel.wandHandles, id: \.handleName) { wandHandle in
                            WandHandleCardView(wandHandleModel: wandHandle, animation: animation)
                                .onTapGesture {
                                    wandHandleViewModel.selectedWandHandle = wandHandle

                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        isBroomSelected = true
                                    }
                                }
                                .padding(.top)
                        }
                    }
                    .padding(.horizontal, 10)
                }
                .padding(.top, isOffsetableScrollViewDraggedUp ? 199 : 200)
            }
            
            VStack {
                TextStyleView(text: "Wand Handles", isOffsetableScrollViewDraggedUp: $isOffsetableScrollViewDraggedUp)
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
            wandHandleViewModel.getWandHandles()
        }
    }
}

struct WandHandlesScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WandHandlesScreenView()
    }
}
