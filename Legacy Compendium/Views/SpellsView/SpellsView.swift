//
//  HomeView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 24-02-23.
//

import SwiftUI

struct SpellsView: View {
    @StateObject private var spellsViewModel = SpellsViewModel()
    @GestureState private var dragOffset: CGFloat = 0
    @State private var offset: CGFloat = 0
    @State private var isOffsetableScrollViewDraggedUp = false
    @State private var isSpellCardTapped = false
    @State private var showSpellContent = false
    @State private var showContent = false
    @Namespace private var animation
    private let gridForm = [GridItem(.flexible())]
    
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
                    VStack(spacing: 40) {
                        //MARK: - Damage type
                        VStack {
                            CategoryTitleView(categoryName: "Damage Spells")
                                .padding(.top, isOffsetableScrollViewDraggedUp ? 199 : 200)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(spellsViewModel.damageSpells, id: \.spellName) { damageSpell in
                                        SpellCardView(spellModel: damageSpell, animation: animation)
                                            .transition(.offset(x: 1, y: 1))
                                            .onTapGesture {
                                                DispatchQueue.main.async {
                                                    withAnimation(.easeInOut(duration: 0.3)) {
                                                        spellsViewModel.tappedCardModel = damageSpell
                                                        isSpellCardTapped = true
                                                    }
                                                }
                                            }
                                    }
                                }
                                .frame(maxHeight: isSpellCardTapped ? .infinity : 400)
                                .padding(.horizontal, 20)
                            }
                        }
                        
                        //MARK: - Control type
                        VStack {
                            CategoryTitleView(categoryName: "Control Spells")
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(spellsViewModel.controlSpells, id: \.spellName) { controlSpell in
                                        SpellCardView(spellModel: controlSpell, animation: animation)
                                            .onTapGesture {
                                                withAnimation(.easeInOut(duration: 0.3)) {
                                                    spellsViewModel.tappedCardModel = controlSpell
                                                    isSpellCardTapped = true
                                                }
                                            }
                                    }
                                }
                                .frame(maxHeight: isSpellCardTapped ? .infinity : 400)
                                .padding(.horizontal, 20)
                            }
                        }
                        
                        //MARK: - Force type
                        VStack {
                            CategoryTitleView(categoryName: "Force Spells")
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(spellsViewModel.forceSpells, id: \.spellName) { forceSpell in
                                        SpellCardView(spellModel: forceSpell, animation: animation)
                                            .onTapGesture {
                                                withAnimation(.easeInOut(duration: 0.3)) {
                                                    spellsViewModel.tappedCardModel = forceSpell
                                                    isSpellCardTapped = true
                                                }
                                            }
                                    }
                                }
                                .frame(maxHeight: isSpellCardTapped ? .infinity : 400)
                                .padding(.horizontal, 20)
                            }
                        }
                        
                        //MARK: - Utility type
                        VStack {
                            CategoryTitleView(categoryName: "Utility Spells")
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(spellsViewModel.utilitySpells, id: \.spellName) { utilitySpell in
                                        SpellCardView(spellModel: utilitySpell, animation: animation)
                                            .onTapGesture {
                                                withAnimation(.easeInOut(duration: 0.3)) {
                                                    spellsViewModel.tappedCardModel = utilitySpell
                                                    isSpellCardTapped = true
                                                }
                                            }
                                    }
                                }
                                .frame(maxHeight: isSpellCardTapped ? .infinity : 400)
                                .padding(.horizontal, 20)
                            }
                        }
                        
                        //MARK: - Curse type
                        VStack {
                            CategoryTitleView(categoryName: "Unforgivable Curses")
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(spellsViewModel.curseSpells, id: \.spellName) { curseSpell in
                                        SpellCardView(spellModel: curseSpell, animation: animation)
                                            .onTapGesture {
                                                withAnimation(.easeInOut(duration: 0.3)) {
                                                    spellsViewModel.tappedCardModel = curseSpell
                                                    isSpellCardTapped = true
                                                }
                                            }
                                    }
                                }
                                .frame(maxHeight: isSpellCardTapped ? .infinity : 400)
                                .padding(.horizontal, 20)
                            }
                        }
                        
                        //MARK: - Essential type
                        VStack {
                            CategoryTitleView(categoryName: "Essential Spells")
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(spellsViewModel.essentialSpells, id: \.spellName) { essentialSpell in
                                        SpellCardView(spellModel: essentialSpell, animation: animation)
                                            .onTapGesture {
                                                withAnimation(.easeInOut(duration: 0.3)) {
                                                    spellsViewModel.tappedCardModel = essentialSpell
                                                    isSpellCardTapped = true
                                                }
                                            }
                                    }
                                }
                                .frame(maxHeight: isSpellCardTapped ? .infinity : 400)
                                .padding(.horizontal, 20)
                            }
                        }
                    }
                }
                
                VStack {
                    TextStyleView(text: "Spells", isOffsetableScrollViewDraggedUp: $isOffsetableScrollViewDraggedUp)
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
            if isSpellCardTapped {
                ZStack {
                    Color("Background").opacity(isSpellCardTapped ? 1 : 0)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.3).delay(0.05)) {
                                isSpellCardTapped = false
                            }

                            withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.85)) {
                                showSpellContent = false
                            }

                            withAnimation(.easeInOut(duration: 0.1)) {
                                showContent = false
                            }
                        }
                    
                    SpellExtendedCardVIew(spellModel: spellsViewModel.tappedCardModel, showContent: $showContent, animation: animation)
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
                                        withAnimation(.easeInOut(duration: 0.3).delay(0.05)) {
                                            isSpellCardTapped = false
                                        }
                                        
                                        withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.85)) {
                                            showSpellContent = false
                                        }
                                        
                                        withAnimation(.easeInOut(duration: 0.3)) {
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
                .onAppear {
                    withAnimation(.easeOut(duration: 0.3)) {
                        showSpellContent = true
                    }
                }
                .onDisappear {
                    offset = 0
                }
                .ignoresSafeArea()
            }
        }
        .onAppear {
            spellsViewModel.getSpellsByType()
        }
    }
}

struct SpellsView_Previews: PreviewProvider {
    static var previews: some View {
        SpellsView()
    }
}
