//
//  SpellCardView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 24-02-23.
//

import SwiftUI
import Kingfisher

struct SpellCardView: View {
    
    @State var spellModel: SpellsAndCharm
    var animation: Namespace.ID
    
    var body: some View {
        ZStack(alignment: .top) {
            CardBackgroundView()
                .shadow(color: Color(.black).opacity(0.2), radius: 5)
            
            KFImage(URL(string: spellModel.img))
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .matchedGeometryEffect(id: "image\(spellModel.spellName)", in: animation)
                .frame(width: 60)
                .offset(y: -25)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("SelectedOptionBorder").opacity(spellModel.spellName == "Basic Cast" ? 0 : 1), lineWidth: 2)
                        .matchedGeometryEffect(id: "image\(spellModel.spellName)border", in: animation)
                        .offset(y: -25)
                )
            
            VStack {
                Text(spellModel.spellName)
                    .font(.custom("CrimesOfGrindelwald", size: 20))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("SelectedOptionBorder"))
                    .matchedGeometryEffect(id: "spellName\(spellModel.spellName)", in: animation)
                    .padding(.top, 22)
                    .padding(.horizontal, 5)
                
                VStack {
                    HStack(spacing: 5)  {
                        Text("Type")
                            .font(.custom("UniversityOldstyleBook", size: 16))
                            .foregroundColor(.gray)
                        
                        Text(spellModel.type)
                            .font(.custom("UniversityOldstyleBook", size: 16))
                            .foregroundColor(.purple)
                            .multilineTextAlignment(.leading)
                    }
                    .matchedGeometryEffect(id: "type\(spellModel.spellName)", in: animation)
                    
                    HStack(spacing: 5) {
                        Text("Cooldown")
                            .font(.custom("UniversityOldstyleBook", size: 16))
                            .foregroundColor(.gray)
                        
                        Text(spellModel.cooldown)
                            .font(.custom("UniversityOldstyleBook", size: 16))
                            .foregroundColor(.white)
                    }
                    .matchedGeometryEffect(id: "cooldown\(spellModel.spellName)", in: animation)
                }
                .padding(.top, 5)
                .padding(.horizontal, 5)
                
                Text(spellModel.description)
                    .font(.custom("UniversityOldstyleBook", size: 16))
                    .matchedGeometryEffect(id: "description\(spellModel.spellName)", in: animation)
                    .foregroundColor(Color("SelectedOptionBorder"))
                    .padding(.horizontal, 5)
                    .padding(.top, 10)
                
                
            }
            .padding(10)
            .padding(.top, 10)
        }
        .matchedGeometryEffect(id: "allView\(spellModel.spellName)", in: animation)
        .padding(.vertical, 30)
        .frame(width: 220, height: 270)
    }
}

struct SpellCardView_Previews: PreviewProvider {
    
    @Namespace static var animation
    @State static private var spellModel = SpellsAndCharm(spellName: "Accio", type: "Force", cooldown: "8 Seconds", unlock: "Main Quest - Charms Class", description: "Yanks most enemies to you, and pulls them airborne. Used in exploration to grab collectibles.", upgrades: "Also lifts enemies around target into air.", img: "https://firebasestorage.googleapis.com/v0/b/legacy-helper.appspot.com/o/Spells%2Faccio.avif?alt=media&token=0e12d0f8-1db0-4e36-acd6-44499272e023")
    
    static var previews: some View {
//        SpellCardView(spellModel: spellModel, animation: animation)
        DashboardView(isTransitionActive: .constant(false))
    }
}
