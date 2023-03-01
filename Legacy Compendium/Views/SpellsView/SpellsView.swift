//
//  HomeView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 24-02-23.
//

import SwiftUI

struct SpellsView: View {
    @StateObject private var spellsViewModel = SpellsViewModel()
    @State private var currentYAxis:CGFloat = 0
    @State private var isOffsetableScrollViewDraggedUp = false
    @State private var currentIndex = 0
    @State private var isSpellCardTapped = false
    @State private var showSpellContent = false
    @State private var showContent = false
    private let gridForm = [GridItem(.flexible())]
    @Namespace private var animation
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            if !isSpellCardTapped {
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
                    if !isSpellCardTapped {
                        VStack(spacing: 40) {
                            //MARK: - Damage type
                            VStack {
                                CategoryTitleView(categoryName: "Damage Spells")
                                    .padding(.top, isOffsetableScrollViewDraggedUp ? 199 : 200)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyHGrid(rows: gridForm, spacing: 30) {
                                        ForEach(spellsViewModel.damageSpells, id: \.spellName) { damageSpell in
                                            SpellCardView(spellModel: damageSpell, animation: animation)
                                                .padding(.top, 20)
                                                .onTapGesture {
                                                    withAnimation(.easeInOut(duration: 0.3)) {
                                                        spellsViewModel.tappedCardModel = damageSpell
                                                        isSpellCardTapped = true
                                                    }
                                                }
                                        }
                                    }
                                    .padding(.leading, 10)
                                }
                            }
                            
                            //MARK: - Control type
                            VStack {
                                CategoryTitleView(categoryName: "Control Spells")
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyHGrid(rows: gridForm, spacing: 30) {
                                        ForEach(spellsViewModel.controlSpells, id: \.spellName) { controlSpell in
                                            SpellCardView(spellModel: controlSpell, animation: animation)
                                                .padding(.top, 20)
                                                .onTapGesture {
                                                    withAnimation(.easeInOut(duration: 0.3)) {
                                                        spellsViewModel.tappedCardModel = controlSpell
                                                        isSpellCardTapped = true
                                                    }
                                                }
                                        }
                                    }
                                    .padding(.leading, 10)
                                }
                            }
                            
                            //MARK: - Force type
                            VStack {
                                CategoryTitleView(categoryName: "Force Spells")
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyHGrid(rows: gridForm, spacing: 30) {
                                        ForEach(spellsViewModel.forceSpells, id: \.spellName) { forceSpell in
                                            SpellCardView(spellModel: forceSpell, animation: animation)
                                                .padding(.top, 20)
                                                .onTapGesture {
                                                    withAnimation(.easeInOut(duration: 0.3)) {
                                                        spellsViewModel.tappedCardModel = forceSpell
                                                        isSpellCardTapped = true
                                                    }
                                                }
                                        }
                                    }
                                    .padding(.leading, 10)
                                }
                            }
                            
                            //MARK: - Utility type
                            VStack {
                                CategoryTitleView(categoryName: "Utility Spells")
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyHGrid(rows: gridForm, spacing: 30) {
                                        ForEach(spellsViewModel.utilitySpells, id: \.spellName) { utilitySpell in
                                            SpellCardView(spellModel: utilitySpell, animation: animation)
                                                .padding(.top, 20)
                                                .onTapGesture {
                                                    withAnimation(.easeInOut(duration: 0.3)) {
                                                        spellsViewModel.tappedCardModel = utilitySpell
                                                        isSpellCardTapped = true
                                                    }
                                                }
                                        }
                                    }
                                    .padding(.leading, 10)
                                }
                            }
                            
                            //MARK: - Curse type
                            VStack {
                                CategoryTitleView(categoryName: "Unforgivable Curses")
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyHGrid(rows: gridForm, spacing: 30) {
                                        ForEach(spellsViewModel.curseSpells, id: \.spellName) { curseSpell in
                                            SpellCardView(spellModel: curseSpell, animation: animation)
                                                .padding(.top, 20)
                                                .onTapGesture {
                                                    withAnimation(.easeInOut(duration: 0.3)) {
                                                        spellsViewModel.tappedCardModel = curseSpell
                                                        isSpellCardTapped = true
                                                    }
                                                }
                                        }
                                    }
                                    .padding(.leading, 10)
                                }
                            }
                            
                            //MARK: - Essential type
                            VStack {
                                CategoryTitleView(categoryName: "Essential Spells")
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyHGrid(rows: gridForm, spacing: 30) {
                                        ForEach(spellsViewModel.essentialSpells, id: \.spellName) { essentialSpell in
                                            SpellCardView(spellModel: essentialSpell, animation: animation)
                                                .padding(.top, 20)
                                                .onTapGesture {
                                                    withAnimation(.easeInOut(duration: 0.3)) {
                                                        spellsViewModel.tappedCardModel = essentialSpell
                                                        isSpellCardTapped = true
                                                    }
                                                }
                                        }
                                    }
                                    .padding(.leading, 10)
                                }
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
        }
        .overlay(alignment: .center) {
            if isSpellCardTapped {
                VStack {
                    SpellExtendedCardVIew(spellModel: spellsViewModel.tappedCardModel, showContent: $showContent, animation: animation)
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
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color("Background").opacity(showSpellContent ? 1 : 0))
                .transition(.asymmetric(insertion: .identity, removal: .offset(x: 0.5)))
                .onAppear {
                    withAnimation(.easeOut(duration: 0.3)) {
                        showSpellContent = true
                    }
                }
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
