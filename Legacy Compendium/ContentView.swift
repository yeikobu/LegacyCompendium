//
//  ContentView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 20-02-23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAnimationShowd = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("Background"))
                .ignoresSafeArea()
            
            
            SplashScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
