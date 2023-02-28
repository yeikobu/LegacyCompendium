//
//  SpellCardView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 24-02-23.
//

import SwiftUI
import Kingfisher

struct SpellCardView: View {
    
//    @State var imgUrl: String
//    @State var spellName: String
//    @State var spellType: String
//    @State var coolDown: String
//    @State var description: String
    @State var spellModel: SpellsAndCharm
    var animation: Namespace.ID
    
    var body: some View {
        ZStack(alignment: .top) {
            CardBackgroundView()
                .shadow(color: Color(.black).opacity(0.2), radius: 5)
                .matchedGeometryEffect(id: "background\(spellModel.spellName)", in: animation)
            
            KFImage(URL(string: spellModel.img))
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .frame(width: 60)
                .offset(y: -25)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("SelectedOptionBorder").opacity(spellModel.spellName == "Basic Cast" ? 0 : 1), lineWidth: 2)
                        .offset(y: -25)
                )
            
            VStack {
                Text(spellModel.spellName)
                    .font(.custom("CrimesOfGrindelwald", size: 20))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("SelectedOptionBorder"))
                    .padding(.top, 22)
                    .padding(.horizontal, 5)
                
                VStack {
                    HStack(spacing: 5)  {
                        Text("Type")
                            .font(.custom("UniversityOldstyleBook", size: 14))
                            .foregroundColor(.gray)
                        
                        Text(spellModel.type)
                            .font(.custom("UniversityOldstyleBook", size: 14))
                            .foregroundColor(.purple)
                            .multilineTextAlignment(.leading)
                    }
                    
                    HStack(spacing: 5) {
                        Text("Cooldown")
                            .font(.custom("UniversityOldstyleBook", size: 14))
                            .foregroundColor(.gray)
                        
                        Text(spellModel.cooldown)
                            .font(.custom("UniversityOldstyleBook", size: 14))
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 5)
                .padding(.horizontal, 5)
                
                Text(spellModel.description)
                    .font(.custom("UniversityOldstyleBook", size: 14))
                    .foregroundColor(Color("SelectedOptionBorder"))
                    .padding(.horizontal, 5)
                    .padding(.top, 10)
                
                
            }
            .padding(10)
            .padding(.top, 10)
        }
        .padding(.vertical, 10)
        .frame(width: 220, height: 250)
        .matchedGeometryEffect(id: "allView\(spellModel.spellName)", in: animation)
    }
}

struct SpellCardView_Previews: PreviewProvider {
    
    @Namespace static var animation
    @State static private var spellModel = SpellsAndCharm(spellName: "Accio", type: "Force", cooldown: "8 Seconds", unlock: "Main Quest - Charms Class", description: "Yanks most enemies to you, and pulls them airborne. Used in exploration to grab collectibles.", upgrades: "Also lifts enemies around target into air.", img: "https://firebasestorage.googleapis.com/v0/b/legacy-helper.appspot.com/o/Spells%2Faccio.avif?alt=media&token=0e12d0f8-1db0-4e36-acd6-44499272e023")
    
    static var previews: some View {
        SpellCardView(spellModel: spellModel, animation: animation)
    }
}
