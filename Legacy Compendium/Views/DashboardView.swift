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
                    Text("HOME")
                        .font(.custom("UniversityOldstyleBook", size: 28))
                        .foregroundColor(Color("Title"))
                        .multilineTextAlignment(.center)
                        .offset(x: animationAfterSlashScreen ? 0 : -400)
                        .scaleEffect(animationAfterSlashScreen ? 1 : 5)
                        .shadow(color:Color("border"), radius: 5)
                    
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
