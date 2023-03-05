//
//  BroomsScreenView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 04-03-23.
//

import SwiftUI

struct BroomsScreenView: View {
    
    
    @StateObject private var broomsViewModel = BroomsViewModel()
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
                    LazyVGrid(columns: gridForm) {
                        ForEach(broomsViewModel.brooms, id: \.broomName) { broom in
                            BroomCardView(broomModel: broom, animation: animation)
                                .onTapGesture {
                                    broomsViewModel.selectedBroom = broom

                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        isBroomSelected = true
                                    }
                                }
                        }
                    }
                    .padding(.horizontal, 10)
                }
                .padding(.top, isOffsetableScrollViewDraggedUp ? 199 : 200)
            }
            
            VStack {
                TextStyleView(text: "Brooms", isOffsetableScrollViewDraggedUp: $isOffsetableScrollViewDraggedUp)
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
            if isBroomSelected {
                ZStack {
                    Color("Background").opacity(isBroomSelected ? 1 : 0)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                isBroomSelected = false
                            }
                            
                            withAnimation(.easeInOut(duration: 0.1)) {
                                showContent = false
                            }
                        }
                    
                    BroomExtendedCardView(broomModel: broomsViewModel.selectedBroom, showContent: $showContent, animation: animation)
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
                                            isBroomSelected = false
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
            broomsViewModel.getBroom()
        }
    }
}

struct BroomsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        BroomsScreenView()
    }
}
