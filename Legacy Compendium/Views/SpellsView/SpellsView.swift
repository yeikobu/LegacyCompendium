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
                            LazyHGrid(rows: gridForm, spacing: 30) {
                                ForEach(spellsViewModel.damageSpells, id: \.self) { damageSpell in
                                    SpellCardView(imgUrl: damageSpell.img, spellName: damageSpell.spellName, spellType: damageSpell.type, coolDown: damageSpell.cooldown, description: damageSpell.description)
                                        .padding(.top, 20)
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
                                ForEach(spellsViewModel.controlSpells, id: \.self) { controlSpell in
                                    SpellCardView(imgUrl: controlSpell.img, spellName: controlSpell.spellName, spellType: controlSpell.type, coolDown: controlSpell.cooldown, description: controlSpell.description)
                                        .padding(.top, 20)
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
                                ForEach(spellsViewModel.forceSpells, id: \.self) { forceSpell in
                                    SpellCardView(imgUrl: forceSpell.img, spellName: forceSpell.spellName, spellType: forceSpell.type, coolDown: forceSpell.cooldown, description: forceSpell.description)
                                        .padding(.top, 20)
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
                                ForEach(spellsViewModel.utilitySpells, id: \.self) { utilitySpell in
                                    SpellCardView(imgUrl: utilitySpell.img, spellName: utilitySpell.spellName, spellType: utilitySpell.type, coolDown: utilitySpell.cooldown, description: utilitySpell.description)
                                        .padding(.top, 20)
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
                                ForEach(spellsViewModel.curseSpells, id: \.self) { curseSpell in
                                    SpellCardView(imgUrl: curseSpell.img, spellName: curseSpell.spellName, spellType: curseSpell.type, coolDown: curseSpell.cooldown, description: curseSpell.description)
                                        .padding(.top, 20)
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
                                ForEach(spellsViewModel.essentialSpells, id: \.self) { essentialSpell in
                                    SpellCardView(imgUrl: essentialSpell.img, spellName: essentialSpell.spellName, spellType: essentialSpell.type, coolDown: essentialSpell.cooldown, description: essentialSpell.description)
                                        .padding(.top, 20)
                                }
                            }
                            .padding(.leading, 10)
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
