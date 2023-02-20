//
//  HarryPotterTransition.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 20-02-23.
//

import SwiftUI

struct HarryPotterTransition: View {
    
    @State private var showMainView = false
    
    var body: some View {
        ZStack {
            if showMainView {
                MainView()
            } else {
                StartView()
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 3)) {
                            showMainView.toggle()
                        }
                    }
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct StartView: View {
    
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Image("hogwarts")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .brightness(-0.3)
                .blur(radius: 2)
                .overlay(Color.black.opacity(0.4))
            VStack {
                Image("harry_potter_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.7)
                    .shadow(color: .white, radius: 5)
                    .padding(.bottom, 20)
                Text("Bienvenido a Hogwarts")
                    .font(.custom("HogwartsWizard", size: 50))
                    .foregroundColor(.white)
                    .opacity(isAnimating ? 1 : 0)
                    .scaleEffect(isAnimating ? 1.5 : 1)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 3)) {
                            isAnimating = true
                        }
                    }
                    .padding(.horizontal, 40)
            }
        }
    }
}

struct MainView: View {
    
    var body: some View {
        ZStack {
            Image("hogwarts")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            VStack {
                Image("hogwarts_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.7)
                    .shadow(color: .white, radius: 5)
                    .padding(.bottom, 20)
//                Text("Explora el castillo, aprende hechizos y defiéndete de los peligros que acechan en los pasillos.")
//                    .font(.headline)
//                    .fontWeight(.semibold)
//                    .foregroundColor(.white)
//                    .multilineTextAlignment(.center)
//                    .padding(.horizontal, 20)
            }
        }
    }
}

struct HarryPotterTransition_Previews: PreviewProvider {
    static var previews: some View {
        HarryPotterTransition()
    }
}
