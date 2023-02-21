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
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        //TODO
                    } label: {
                        VStack {
                            Image(systemName: "wand.and.stars")
                                .foregroundColor(Color(.gray))
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                        }
                        .padding()
                        .background {
                            ZStack {
                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                                    .fill(.ultraThinMaterial).blur(radius: 0)
                                    .blur(radius: 0)
                                    .opacity(0.5)
                                
                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                                    .fill(Color("Background"))
                                    .blur(radius: 0)
                                    .opacity(0.85)
                            }
                        }
                        .cornerRadius(30)
                        .shadow(color: Color(.gray).opacity(0.2), radius: 5)
                    }
                    .offset(x: animationAfterSlashScreen ? 0 : 2000)
                }
                .padding(.bottom, 100)
                .padding(.horizontal, 20)
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
