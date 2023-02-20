//
//  SplashScreen.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 20-02-23.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isScreenAppeared = false
    var body: some View {
        VStack {
            VStack {
                Text("Legacy Compendium")
                    .font(.custom("CrimesOfGrindelwald", size: 42))
                    .foregroundColor(Color("Title"))
                    .multilineTextAlignment(.center)
                    .scaleEffect(isScreenAppeared ? 2 : 1)
                    .opacity(isScreenAppeared ? 0 : 1)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.linear(duration: 5)) {
                    isScreenAppeared = true
                }
            }
//            DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
//                withAnimation(.linear(duration: 2)) {
//                    isScreenAppeared = false
//                }
//            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
