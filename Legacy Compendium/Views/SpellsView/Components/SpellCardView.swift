//
//  SpellCardView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 24-02-23.
//

import SwiftUI

struct SpellCardView: View {
    var body: some View {
        ZStack(alignment: .top) {
            CardBackgroundView()
                .shadow(color: Color("Title").opacity(0.08), radius: 5)
            
            AsyncImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/legacy-helper.appspot.com/o/Spells%2Faccio.avif?alt=media&token=0e12d0f8-1db0-4e36-acd6-44499272e023")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .frame(width: 60)
            } placeholder: {
                ProgressView()
                    .tint(.white)
                    .scaleEffect(1.5)
                    .padding(10)
            }
            .offset(y: -25)
            
            VStack(alignment: .center, spacing: 10) {
                Text("Accio")
                    .font(.system(size: 25, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.top, 50)
                    .padding(.bottom, 5)
                
                HStack {
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 5)  {
                        Text("Type")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundColor(.gray)
                        
                        Text("Force")
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .foregroundColor(.purple)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Cooldown")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundColor(.gray)
                        
                        Text("8 seconds")
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                }
                
                Text("Yanks most enemies to you, and pulls them airborne. Used in exploration to grab collectibles.")
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.horizontal, 5)
                
                Spacer()
            }
            .padding(10)
            .padding(.top, 10)
        }
        .padding(10)
        .frame(height: 300)
    }
}

struct SpellCardView_Previews: PreviewProvider {
    static var previews: some View {
        SpellCardView()
    }
}
