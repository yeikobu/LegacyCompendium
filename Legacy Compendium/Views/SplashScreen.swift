//
//  SplashScreen.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 20-02-23.
//

import SwiftUI

struct SplashScreen: View {
    
    @Binding var isScreenAppeared: Bool
    
    var body: some View {
        VStack {
            VStack {
                Text("Legacy Compendium")
                    .font(.custom("CrimesOfGrindelwald", size: 42))
                    .foregroundColor(Color(.black))
                    .shadow(color:Color(.black), radius: 1)
                    .multilineTextAlignment(.center)
                    .overlay(
                        Text("Legacy Compendium")
                            .font(.custom("CrimesOfGrindelwald", size: 41))
                            .foregroundColor(Color("Border"))
                            .multilineTextAlignment(.center)
                            .shadow(color:Color("Border"), radius: 1)
                    )
                    .overlay(
                        Text("Legacy Compendium")
                            .font(.custom("CrimesOfGrindelwald", size: 41))
                            .foregroundColor(Color("Title"))
                            .multilineTextAlignment(.center)
                            .shadow(color:Color(.black), radius: 1)
                    )
                    .scaleEffect(isScreenAppeared ? 2 : 1)
                    .opacity(isScreenAppeared ? 0 : 1)
                    .shadow(color:Color(.black), radius: 1)
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
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen(isScreenAppeared: .constant(false))
    }
}
