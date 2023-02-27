//
//  SpellCardView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 24-02-23.
//

import SwiftUI
import Kingfisher

struct SpellCardView: View {
    
    @State var imgUrl: String
    @State var spellName: String
    @State var spellType: String
    @State var coolDown: String
    @State var description: String
    
    var body: some View {
        ZStack(alignment: .top) {
            CardBackgroundView()
                .shadow(color: Color(.black).opacity(0.2), radius: 5)
            
            KFImage(URL(string: imgUrl))
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .frame(width: 60)
                .offset(y: -25)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("SelectedOptionBorder").opacity(spellName == "Basic Cast" ? 0 : 1), lineWidth: 2)
                        .offset(y: -25)
                )
            
            VStack {
                Text(spellName)
                    .font(.system(size: 25, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.top, 20)
                
                VStack {
                    HStack(spacing: 5)  {
                        Text("Type")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundColor(.gray)
                        
                        Text(spellType)
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .foregroundColor(.purple)
                            .multilineTextAlignment(.leading)
                    }
                    
                    HStack(spacing: 5) {
                        Text("Cooldown")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundColor(.gray)
                        
                        Text(coolDown)
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 5)
                
                Text(description)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.horizontal, 5)
                    .padding(.top, 10)
                
                
            }
            .padding(10)
            .padding(.top, 10)
        }
        .padding(10)
        .frame(height: 250)
    }
}

struct SpellCardView_Previews: PreviewProvider {
    static var previews: some View {
        SpellCardView(imgUrl: "https://firebasestorage.googleapis.com/v0/b/legacy-helper.appspot.com/o/Spells%2Faccio.avif?alt=media&token=0e12d0f8-1db0-4e36-acd6-44499272e023", spellName: "Accio", spellType: "Force", coolDown: "8 seconds", description: "Yanks most enemies to you, and pulls them airborne. Used in exploration to grab collectibles.")
    }
}
