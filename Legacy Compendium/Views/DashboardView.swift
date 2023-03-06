//
//  DashboardView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 20-02-23.
//

import SwiftUI

struct DashboardView: View {
    
    @StateObject var dashboardViewModel = DashboardViewModel()
    @Binding var isTransitionActive: Bool
    @Namespace var animation
    @State private var menuFontSize: CGFloat = 22
    @State private var offsetTransition: CGFloat = 400
    @State private var animationAfterSplashScreen = false
    @State private var isOptionTapped = false
    @State private var textSizeChanged = false
    
    var body: some View {
        ZStack {
            VStack {
                //MARK: If button tapped shows the menu
                if dashboardViewModel.isShowMenuButtonTapped {
                    ForEach(dashboardViewModel.menuOptions, id: \.self) { option in
                        ZStack(alignment: .center) {
                            if dashboardViewModel.selectedOption == option {
                                SelectedOptionView(animation: animation)
                                    .matchedGeometryEffect(id: "selectedOptionBackground", in: animation)
                                    .padding(.top, 10)
                                    .offset(x: dashboardViewModel.selectedOptionBackgroundTransition ? 0 : 2000)
                            }
                            
                            TextStyleView(text: option, isOffsetableScrollViewDraggedUp: $textSizeChanged)
                                .matchedGeometryEffect(id: "\(option)", in: animation)
                                .padding(.horizontal, 20)
                                .padding(.top, 20)
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.2, dampingFraction: 1)) {
                                        dashboardViewModel.selectedOption = option
                                    }
                                    
                                    dashboardViewModel.hideMenuWhenOptionIsSelected()
                                }
                        }
                    }
                }
            }
            .padding(.top, -80)
            
            VStack {
                if dashboardViewModel.selectedOption == "Spells" {
                   SpellsView()
                        .opacity(dashboardViewModel.isShowMenuButtonTapped ? 0 : 1)
                }
                
                if dashboardViewModel.selectedOption == "Beasts" {
                    BeastsScreenView()
                        .opacity(dashboardViewModel.isShowMenuButtonTapped ? 0 : 1)
                }
                
                if dashboardViewModel.selectedOption == "Brooms" {
                    BroomsScreenView()
                        .opacity(dashboardViewModel.isShowMenuButtonTapped ? 0 : 1)
                }
                
                if dashboardViewModel.selectedOption == "Wand Handles" {
                    WandHandlesScreenView()
                        .opacity(dashboardViewModel.isShowMenuButtonTapped ? 0 : 1)
                }
                
                if dashboardViewModel.selectedOption == "Potions" {
                    PotionsView()
                        .opacity(dashboardViewModel.isShowMenuButtonTapped ? 0 : 1)
                }
                
                if dashboardViewModel.selectedOption == "Companions" {
                    Text("Companions View")
                        .foregroundColor(Color.white)
                        .opacity(dashboardViewModel.isShowMenuButtonTapped ? 0 : 1)
                }
                
                if dashboardViewModel.selectedOption == "Professors" {
                    Text("Professors View")
                        .foregroundColor(Color.white)
                        .opacity(dashboardViewModel.isShowMenuButtonTapped ? 0 : 1)
                }
                
                if dashboardViewModel.selectedOption == "Challenges" {
                    Text("Challenges View")
                        .foregroundColor(Color.white)
                        .opacity(dashboardViewModel.isShowMenuButtonTapped ? 0 : 1)
                }
                
                if dashboardViewModel.selectedOption == "Enemies" {
                    Text("Enemies View")
                        .foregroundColor(Color.white)
                        .opacity(dashboardViewModel.isShowMenuButtonTapped ? 0 : 1)
                }
            }
            
            //MARK: - Button and Menu (Menu is hidden behind the button)
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    ZStack {
                        //MARK: If button menu not tapped, hide the menu bihind the button
                        if !dashboardViewModel.isShowMenuButtonTapped {
                            ForEach(dashboardViewModel.menuOptions, id: \.self) { option in
                                ZStack {
                                    if dashboardViewModel.selectedOption == option {
                                        SelectedOptionView(animation: animation)
                                            .matchedGeometryEffect(id: "selectedOptionBackground", in: animation)
                                            .padding(.top, 10)
                                            .opacity(0)
                                            .frame(width: 0, height: 0)
                                    }
                                    
                                    TextStyleView(text: option, isOffsetableScrollViewDraggedUp: $textSizeChanged)
                                        .matchedGeometryEffect(id: "\(option)", in: animation)
                                        .frame(width: 0, height: 0)
                                }
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing, 20)
                            }
                        }
                        
                        //MARK: showMenuButton
                        VStack {
                            Button {
                                dashboardViewModel.showOrHideMenuWhenButtonIsTapped()
                            } label: {
                                VStack {
                                    Image(systemName: !dashboardViewModel.isShowMenuButtonTapped ? "wand.and.stars" : "xmark")
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
                                .shadow(color: dashboardViewModel.isShowMenuButtonTapped ? Color(.black).opacity(0.3) : Color("Title").opacity(0.2), radius: dashboardViewModel.isShowMenuButtonTapped ? 10 : 20)
                            }
                            .offset(x: animationAfterSplashScreen ? 0 : 4000)
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
                .padding(.bottom, 50)
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
