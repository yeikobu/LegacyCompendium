//
//  DashboardView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 20-02-23.
//

import SwiftUI

struct DashboardView: View {
    
    @StateObject var dashboardViewModel = DashboardViewModel()
    @StateObject var storeKitTool = StoreKitTool()
    @Binding var isTransitionActive: Bool
    @Namespace var animation
    @State private var animationAfterSplashScreen = false
    @State private var isOptionTapped = false
    @State private var textSizeChanged = false
    @State private var isFullAppPurchased = false
    
    var body: some View {
        ZStack {
            VStack {
                //MARK: If button is tapped it shows the menu
                if dashboardViewModel.isShowMenuButtonTapped {
                    ForEach(dashboardViewModel.menuOptions, id: \.self) { option in
                        ZStack(alignment: .center) {
                            if dashboardViewModel.selectedOption == option {
                                SelectedOptionView(animation: animation)
                                    .matchedGeometryEffect(id: "selectedOptionBackground", in: animation)
                                    .padding(.top, 10)
                                    .offset(x: dashboardViewModel.selectedOptionBackgroundTransition ? 0 : 2000)
                            }
                            
                            HStack(spacing: 0) {
                                TextStyleView(text: option, isOffsetableScrollViewDraggedUp: $textSizeChanged)
                                    .padding(.horizontal, 20)
                                    .padding(.top, 20)
                                
                                //If the showed options on the menu are not spells and companion and the user has not purchased the app, a lock icon appears in the left side of the menu's option
                                if option != "Spells" && option != "Companions" && !isFullAppPurchased {
                                    Image(systemName: "lock.shield")
                                        .font(.system(size: 25))
                                        .foregroundColor(Color("Title"))
                                        .shadow(color:Color(.gray), radius: 1)
                                        .padding(.leading, -10)
                                        .padding(.top, 15)
                                }
                            }
                            .matchedGeometryEffect(id: "\(option)", in: animation)
                            .onTapGesture {
                                //If the option showed in the menu are spells, companions and user does not purchased the full app, he only can acces to spells and companions screens
                                if option == "Spells" || option == "Companions" || isFullAppPurchased {
                                    withAnimation(.spring(response: 0.2, dampingFraction: 1)) {
                                        dashboardViewModel.selectedOption = option
                                    }
                                    
                                    dashboardViewModel.hideMenuWhenOptionIsSelected()
                                }
                            }
                        }
                    }
                    .offset(x: dashboardViewModel.isSettingsMenuShowed ? 2000 : 0)
                }
            }
            .padding(.top, -80)
            
            //MARK: Settings menu appears when the settings button is tapped
            VStack {
                ForEach(dashboardViewModel.settingsMenuOptions, id: \.self) { settingsOption in
                    TextStyleView(text: settingsOption, isOffsetableScrollViewDraggedUp: $textSizeChanged)
                        .matchedGeometryEffect(id: "\(settingsOption)", in: animation)
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                        .onTapGesture {
                            if dashboardViewModel.selectedOption != "Unlock full app" {
                                withAnimation(.spring(response: 0.2, dampingFraction: 1)) {
                                    dashboardViewModel.selectedOption = settingsOption
                                }
                                
                                dashboardViewModel.hideMenuWhenOptionIsSelected()
                            }
                        }
                }
                
                if !isFullAppPurchased {
                    VStack {
                        Button {
                            Task {
                                try await storeKitTool.purchase()
                            }
                        } label: {
                            ZStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(.ultraThinMaterial)
                                        .blur(radius: 0)
                                        .opacity(0.85)
                                    
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(Color("Card"))
                                        .blur(radius: 0)
                                        .opacity(0.80)
                                }
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color("SelectedOptionBorder"), lineWidth: 2)
                                )
                                .shadow(color: Color(.black).opacity(0.8), radius: 5, x: -2 ,y: 5)
                                    .padding(30)
                                    .frame(maxWidth: .infinity, maxHeight: 110)
                                
                                HStack {
                                    Text("Unlock the full app")
                                        .font(.custom("CrimesOfGrindelwald", size: 20))
                                        .foregroundColor(Color("Title"))
                                        .shadow(color:Color(.gray), radius: 1)
                                        .multilineTextAlignment(.center)
                                    
                                    if storeKitTool.purchasedIDs.isEmpty {
                                        if let product = storeKitTool.products.first {
                                            //Text shows the storekit appstore price
                                            Text("(\(product.displayPrice))")
                                                .foregroundColor(Color("Title"))
                                                .shadow(color:Color(.gray), radius: 1)
                                                .multilineTextAlignment(.center)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .offset(x: dashboardViewModel.isSettingsMenuShowed ? 0 : -2000)
            
            //MARK: If menu button is tapped show the settings button
            if dashboardViewModel.isShowMenuButtonTapped {
                ZStack {
                    Button {
                        dashboardViewModel.showSettingsMenu()
                    } label: {
                        VStack {
                            Image(systemName: dashboardViewModel.isSettingsMenuShowed ? "chevron.left" : "gearshape.fill")
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
                        .shadow(color: dashboardViewModel.isSettingsButtonShowed ? Color(.black).opacity(0.3) : Color("Title").opacity(0.2), radius: dashboardViewModel.isSettingsButtonShowed ? 10 : 20)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(.horizontal, 20)
                .padding(.top, 10)
                .offset(x: dashboardViewModel.isSettingsButtonShowed ? 0 : -3000)
            }
            
            //MARK: - Menu Options Views
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
                    CompanionsScreenView()
                        .opacity(dashboardViewModel.isShowMenuButtonTapped ? 0 : 1)
                }
                
                if dashboardViewModel.selectedOption == "Professors" {
                    ProfessorsScreenView()
                        .opacity(dashboardViewModel.isShowMenuButtonTapped ? 0 : 1)
                }
                
                if dashboardViewModel.selectedOption == "Enemies" {
                    EnemiesScreenView()
                        .opacity(dashboardViewModel.isShowMenuButtonTapped ? 0 : 1)
                }
                
                if dashboardViewModel.selectedOption == "Challenges" {
                    Text("Coming soon")
                        .foregroundColor(Color.white)
                        .font(.custom("UniversityOldstyleBook", size: 16))
                        .opacity(dashboardViewModel.isShowMenuButtonTapped ? 0 : 1)
                }
            }
            
            //MARK: - Settings Menu Options Views
            VStack {
                if dashboardViewModel.selectedOption == "Privacy Policy" {
                    PrivacyView()
                        .opacity(dashboardViewModel.isShowMenuButtonTapped ? 0 : 1)
                }
                
                if dashboardViewModel.selectedOption == "Terms of use" {
                    TermsView()
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
                                
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    dashboardViewModel.isSettingsMenuShowed = false
                                }
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
        .task {
            await storeKitTool.fetchProducts()
            
            if !storeKitTool.purchasedIDs.isEmpty {
                isFullAppPurchased = true
            }
        }
        .onChange(of: storeKitTool.action) { action in
            if action == .successful {
                isFullAppPurchased = true
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(isTransitionActive: .constant(true))
            .preferredColorScheme(.dark)
    }
}
