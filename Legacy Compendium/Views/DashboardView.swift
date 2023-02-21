//
//  DashboardView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 20-02-23.
//

import SwiftUI

struct DashboardView: View {
    
    @Binding var isTransitionActive: Bool
    @State private var animationAfterSlashScreen = false
    @Namespace var animation
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                HStack {
                    Text("Home")
                        .font(.custom("CrimesOfGrindelwald", size: 28))
                        .foregroundColor(Color("Title"))
                        .multilineTextAlignment(.center)
                        .offset(x: animationAfterSlashScreen ? 0 : -400)
                        .scaleEffect(animationAfterSlashScreen ? 1 : 5)
                    
                    Spacer()
                    
                    Button {
                        //TODO
                    } label: {
                        VStack {
                            Image(systemName: "wand.and.stars")
                                .foregroundColor(Color("Title"))
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .shadow(color: Color(.gray), radius: 10)
                        }
//                        .padding(5)
//                        .background(Color("Title"))
//                        .cornerRadius(20)
//                        .shadow(color: Color(.gray), radius: 4)
                    }
                    .offset(x: animationAfterSlashScreen ? 0 : 2000)
                }
                
                Spacer()
                
                
            }
            .padding(.horizontal, 20)
            .padding(.top, 100)
            .onAppear {
                if isTransitionActive {
                    withAnimation(.spring(response: 1, dampingFraction: 1)){
                        animationAfterSlashScreen = true
                    }
                    
                    print(animationAfterSlashScreen)
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
