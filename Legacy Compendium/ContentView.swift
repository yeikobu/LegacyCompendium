//
//  ContentView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 20-02-23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAnimationShowed = false
    @State private var isTransitionActive = false
    @StateObject var legacyCompendiumViewModel = LegacyCompendiumViewModel()
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            SplashScreen(isScreenAppeared: $isAnimationShowed)
            
            if isTransitionActive {
                DashboardView(isTransitionActive: $isTransitionActive)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                withAnimation(.spring(response: 0.7, dampingFraction: 1)) {
                    isTransitionActive = true
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
