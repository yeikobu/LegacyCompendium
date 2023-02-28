//
//  SpellExtendedCardVIew.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 28-02-23.
//

import SwiftUI
import Kingfisher

struct SpellExtendedCardVIew: View {
    
    @State var spellModel: SpellsAndCharm
    var animation: Namespace.ID
    
    var body: some View {
        ZStack {
            Color("Background")
            
            ZStack {
                CardBackgroundView()
                    .shadow(color: Color(.black).opacity(0.2), radius: 5)
                    .matchedGeometryEffect(id: "background\(spellModel.spellName)", in: animation)
                
                KFImage(URL(string: spellModel.img))
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .frame(width: 80)
                    .offset(y: -25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("SelectedOptionBorder").opacity(spellModel.spellName == "Basic Cast" ? 0 : 1), lineWidth: 2)
                            .offset(y: -25)
                    )
            }
            .frame(width: 320, height: 380)
            .matchedGeometryEffect(id: "allView\(spellModel.spellName)", in: animation)
        }
        .ignoresSafeArea()
    }
}

struct SpellExtendedCardVIew_Previews: PreviewProvider {
    
    @State static private var spellModel = SpellsAndCharm(spellName: "Accio", type: "Force", cooldown: "8 Seconds", unlock: "Main Quest - Charms Class", description: "Yanks most enemies to you, and pulls them airborne. Used in exploration to grab collectibles.", upgrades: "Also lifts enemies around target into air.", img: "https://firebasestorage.googleapis.com/v0/b/legacy-helper.appspot.com/o/Spells%2Faccio.avif?alt=media&token=0e12d0f8-1db0-4e36-acd6-44499272e023")
    @Namespace static var animation
    
    static var previews: some View {
        SpellExtendedCardVIew(spellModel: spellModel, animation: animation)
    }
}
