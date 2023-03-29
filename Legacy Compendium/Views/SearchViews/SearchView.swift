//
//  SearchView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 23-03-23.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var searchViewModel = SearchViewModel()
    @Binding var isSearchButtonTapped: Bool
    @State private var showBackground = false
    @Namespace private var animation
    @State private var isOffsetableScrollViewDraggedUp = false
    private let gridForm = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            if showBackground {
                BackgroundView()
                    .ignoresSafeArea()
            }
            
            //MARK: - Not tapped rounded button
            VStack {
                ZStack {
                    //MARK: - If rounded button tapped
                    if isSearchButtonTapped {
                        VStack {
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
                                LazyVGrid(columns: gridForm) {
                                    ForEach(searchViewModel.matchedSpells, id: \.self) { matchedSpell in
                                        SpellCardView(spellModel: matchedSpell, animation: animation)
                                    }
                                    
                                    ForEach(searchViewModel.matchedPotions, id: \.self) { matchedPotion in
                                        PotionCardView(potionModel: matchedPotion, animation: animation)
                                    }
                                    
                                    ForEach(searchViewModel.matchedBeasts, id: \.self) { matchedBeast in
                                        BeastCardView(beastModel: matchedBeast, animation: animation)
                                    }
                                    
                                    ForEach(searchViewModel.matchedEnemies, id: \.self) { matchedEnemy in
                                        EnemyCardView(enemyModel: matchedEnemy, animation: animation)
                                    }
                                }
                                .padding(.top, 120)
                                .padding(20)
                                
                                LazyVGrid(columns: gridForm) {
                                    ForEach(searchViewModel.matchedWandHandles, id: \.self) { matchedWandHandle in
                                        WandHandleCardView(wandHandleModel: matchedWandHandle, animation: animation)
                                    }
                                    
                                    ForEach(searchViewModel.matchedBrooms, id: \.self) { matchedBroom in
                                        BroomCardView(broomModel: matchedBroom, animation: animation)
                                    }
                                    
                                    ForEach(searchViewModel.matchedCompanions, id: \.self) { matchedCompanion in
                                        CompanionCardView(companionModel: matchedCompanion, animation: animation)
                                    }
                                    
                                    ForEach(searchViewModel.matchedProfessors, id: \.self) { matchedProfessor in
                                        ProfessorCardView(professorModel: matchedProfessor, animation: animation)
                                    }
                                }
                                .padding(.top, searchViewModel.isCharacter ? 60: 120)
                                .padding(20)
                            }
                            .ignoresSafeArea()
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            
            VStack {
                if isSearchButtonTapped {
                    HStack {
                        HStack {
                            VStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(Color("Border"))
                                    .font(.system(size: 16, weight: .medium, design: .rounded))
                            }
                            .padding(.leading, 10)
                            .onTapGesture {
                                searchViewModel.search()
                            }
                            
                            ZStack(alignment: .leading) {
                                if self.searchViewModel.searchedText.isEmpty {
                                    Text(verbatim: "Search magical stuff")
                                        .font(.custom("UniversityOldstyleBook", size: 20))
                                        .foregroundColor(Color("Border"))
                                }
                                
                                TextField("", text: self.$searchViewModel.searchedText)
                                    .foregroundColor(Color("Border"))
                                    .font(.custom("UniversityOldstyleBook", size: 20))
                                    .keyboardType(.default)
                                    .ignoresSafeArea(.keyboard, edges: .bottom)
                                    .padding(.vertical, 5)
                                    .onChange(of: self.searchViewModel.searchedText) { newText in
                                        if newText == "" {
                                            searchViewModel.removeItems()
                                        }
                                    }
                                    .onSubmit {
                                        searchViewModel.search()
                                    }
                            }
                            
                            VStack {
                                Image(systemName: "xmark")
                                    .foregroundColor(Color("Border"))
                                    .font(.system(size: 16, weight: .medium, design: .rounded))
                            }
                            .padding(.trailing, 10)
                            .onTapGesture {
                                searchViewModel.removeItems()
                                searchViewModel.searchedText = ""
                            }
                        }
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                                    .fill(.ultraThinMaterial).blur(radius: 0)
                                    .blur(radius: 0)
                                    .opacity(0.85)
                                
                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                                    .fill(Color("Buttons"))
                                    .blur(radius: 0)
                                    .opacity(0.85)
                            }
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 30).stroke(Color("Border"), lineWidth: 3)
//                                .matchedGeometryEffect(id: "allsearch", in: animation)
                        )
//                        .matchedGeometryEffect(id: "magnifyingglassbackground", in: animation)
                        .matchedGeometryEffect(id: "magnifyingglass", in: animation)
                        
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.9)) {
                                isSearchButtonTapped.toggle()
                            }
                            
                            withAnimation(.easeInOut(duration: 0.2)) {
                                showBackground = false
                            }
                        } label: {
                            VStack {
                                Image(systemName: "xmark")
                                    .foregroundColor(Color("Border"))
                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                            }
                            .padding(10)
                            .overlay(
                                Circle()
                                    .stroke(Color("Border"), lineWidth: 0.5)
                                    .padding(4)
                            )
                            .background(
                                ZStack {
                                    Circle()
                                        .fill(.ultraThinMaterial).blur(radius: 0)
                                        .blur(radius: 0)
                                        .opacity(0.5)
                                    
                                    Circle()
                                        .fill(Color("Buttons"))
                                        .blur(radius: 0)
                                        .opacity(0.85)
                                }
                            )
                            .overlay(Circle().stroke(Color("Border"), lineWidth: 4))
                            .cornerRadius(40)
                            .shadow(color: Color("Title").opacity(0.2), radius: 20)
                        }
                        .offset(x: isSearchButtonTapped ? 0 : 3000)
                    }
                    .padding(20)
                }
                
                Button {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                        isSearchButtonTapped.toggle()
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            showBackground = true
                        }
                    }
                } label: {
                    VStack {
                        Image(systemName:  "magnifyingglass")
                            .foregroundColor(Color("Border"))
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                    }
                    .padding(10)
                    .background(
                        ZStack {
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .fill(.ultraThinMaterial).blur(radius: 0)
                                .blur(radius: 0)
                                .opacity(0.5)
                            
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .fill(Color("Buttons"))
                                .blur(radius: 0)
                                .opacity(0.85)
                        }
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 30).stroke(Color("Border"), lineWidth: 4)
//                            .matchedGeometryEffect(id: "allsearch", in: animation)
                    )
                    .cornerRadius(40)
                    .shadow(color: Color(.black).opacity(0.3), radius: 10)
                }
//                .matchedGeometryEffect(id: "magnifyingglassbackground", in: animation)
                .matchedGeometryEffect(id: "magnifyingglass", in: animation)
                .padding(20)
                .opacity(isSearchButtonTapped ? 0 : 1)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        }
        .onDisappear {
            searchViewModel.removeItems()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(isSearchButtonTapped: .constant(false))
    }
}
