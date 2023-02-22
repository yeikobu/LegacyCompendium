//
//  DashboardView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 20-02-23.
//

import SwiftUI

struct DashboardView: View {
    
    @StateObject var legacyCompendiumViewModel = LegacyCompendiumViewModel()
    @Binding var isTransitionActive: Bool
    @Namespace var animation
    @State private var menuFontSize: CGFloat = 22
    @State private var offsetTransition: CGFloat = 400
    @State private var animationAfterSplashScreen = false
    
    var body: some View {
        ZStack {
            VStack {
                //MARK: If button tapped shows the menu
                if legacyCompendiumViewModel.isShowMenuButtonTapped {
                    ForEach(legacyCompendiumViewModel.menuOptions, id: \.self) { option in
                        ZStack(alignment: .center) {
                            if legacyCompendiumViewModel.selectedOption == option {
                                SelectedOptionView(animation: animation)
                                    .padding(.top, 10)
                                    .offset(x: legacyCompendiumViewModel.selectedOptionBackgroundTransition ? 0 : 800)
                                    .matchedGeometryEffect(id: "selectedOptionBackground", in: animation)
                            }
                            
                            TextStyleView(text: option, textSize: $menuFontSize)
                                .padding(.horizontal, 20)
                                .padding(.top, 20)
                                .matchedGeometryEffect(id: "\(option)", in: animation)
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.4, dampingFraction: 1)) {
                                        legacyCompendiumViewModel.selectedOption = option
                                    }
                                }
                        }
                    }
                }
            }
            .padding(.top, -80)
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    ZStack {
                        //MARK: If button menu not tapped, hide the menu bihind the button
                        if !legacyCompendiumViewModel.isShowMenuButtonTapped {
                            ForEach(legacyCompendiumViewModel.menuOptions, id: \.self) { option in
                                ZStack {
                                    if legacyCompendiumViewModel.selectedOption == option {
                                        SelectedOptionView(animation: animation)
                                            .padding(.top, 10)
                                            .opacity(0)
                                            .frame(width: 0, height: 0)
                                            .matchedGeometryEffect(id: "selectedOptionBackground", in: animation)
                                    }
                                    
                                    TextStyleView(text: option, textSize: $menuFontSize)
                                        .frame(width: 0, height: 0)
                                        .matchedGeometryEffect(id: "\(option)", in: animation)
                                }
                                .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                        }
                        
                        //MARK: showMenuButton
                        VStack {
                            Button {
                                legacyCompendiumViewModel.changeMenuButtonState()
                            } label: {
                                VStack {
                                    Image(systemName: !legacyCompendiumViewModel.isShowMenuButtonTapped ? "wand.and.stars" : "xmark")
                                        .foregroundColor(Color("Border"))
                                        .font(.system(size: 24, weight: .bold, design: .rounded))
                                }
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color("Border"), lineWidth: 0.5)
                                        .padding(4)
                                )
                                .background {
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
                                }
                                .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color("Border"), lineWidth: 4))
                                .cornerRadius(40)
                                .shadow(color: Color("Title").opacity(0.2), radius: 20)
                            }
                            .offset(x: animationAfterSplashScreen ? 0 : 4000)
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
                .padding(.bottom, 100)
                .padding(.horizontal, 20)
            }
            .padding(.horizontal, 20)
            .padding(.top, 100)
            .onAppear {
                if isTransitionActive {
                    withAnimation(.spring(response: 0.5, dampingFraction: 1)){
                        animationAfterSplashScreen = true
                    }
                }
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(isTransitionActive: .constant(true))
    }
}
