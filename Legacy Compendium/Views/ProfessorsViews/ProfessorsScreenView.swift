//
//  ProfessorsScreenView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 07-03-23.
//

import SwiftUI

struct ProfessorsScreenView: View {
    
    @StateObject private var professorsViewModel = ProfessorsViewModel()
    @State private var isOffsetableScrollViewDraggedUp = false
    @State private var isProfessorSelected = false
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
                        ForEach(professorsViewModel.professors, id: \.self) { professor in
                            ProfessorCardView(professorModel: professor, animation: animation)
                                .onTapGesture {
                                    professorsViewModel.selectedProfessor = professor

                                    withAnimation(.easeOut(duration: 0.3)) {
                                        isProfessorSelected = true
                                    }
                                }
                        }
                    }
                    .padding(.horizontal, 10)
                }
                .padding(.top, isOffsetableScrollViewDraggedUp ? 200 : 200)
            }
            
            VStack {
                TextStyleView(text: "Professors", isOffsetableScrollViewDraggedUp: $isOffsetableScrollViewDraggedUp)
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
            professorsViewModel.getProfessor()
        }
    }
}

struct ProfessorsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ProfessorsScreenView()
    }
}
