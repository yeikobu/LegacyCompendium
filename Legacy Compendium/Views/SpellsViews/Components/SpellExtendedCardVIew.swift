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
    @Binding var showContent: Bool
    var animation: Namespace.ID
    
    var body: some View {
            ZStack {
                CardBackgroundView()
                    .shadow(color: Color(.black).opacity(0.2), radius: 5)
                
                KFImage(URL(string: spellModel.img))
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .matchedGeometryEffect(id: "image\(spellModel.spellName)", in: animation)
                    .frame(width: 100)
                    .offset(y: -240)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("SelectedOptionBorder").opacity(spellModel.spellName == "Basic Cast" ? 0 : 1), lineWidth: 2)
                            .matchedGeometryEffect(id: "image\(spellModel.spellName)border", in: animation)
                            .offset(y: -240)
                    )
                
                VStack {
                    Text(spellModel.spellName)
                        .font(.custom("CrimesOfGrindelwald", size: 20))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("SelectedOptionBorder"))
                        .matchedGeometryEffect(id: "spellName\(spellModel.spellName)", in: animation)
                        .padding(.top, 72)
                        .padding(.horizontal, 5)
                    
                    HStack {
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
                        
                        Spacer()
                        
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
                    .padding(.horizontal, 10)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        if showContent {
                            Text("Description")
                                .font(.custom("UniversityOldstyleBook", size: 16))
                                .foregroundColor(.gray)
                                .opacity(showContent ? 1 : 0)
                        }
                        
                        Text(spellModel.description)
                            .font(.custom("UniversityOldstyleBook", size: 16))
                            .foregroundColor(Color("SelectedOptionBorder"))
                            .matchedGeometryEffect(id: "description\(spellModel.spellName)", in: animation)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 10)
                    
                    if showContent {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("How to get")
                                .font(.custom("UniversityOldstyleBook", size: 16))
                                .foregroundColor(.gray)
                                .opacity(showContent ? 1 : 0)
                            
                            Text(spellModel.unlock)
                                .font(.custom("UniversityOldstyleBook", size: 16))
                                .foregroundColor(Color("SelectedOptionBorder"))
                        }
                        .matchedGeometryEffect(id: "unlock\(spellModel.spellName)", in: animation)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 10)
                        .padding(.horizontal, 10)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Upgrades")
                                .font(.custom("UniversityOldstyleBook", size: 16))
                                .foregroundColor(.gray)
                                .opacity(showContent ? 1 : 0)
                            
                            Text(spellModel.upgrades)
                                .font(.custom("UniversityOldstyleBook", size: 16))
                                .foregroundColor(Color("SelectedOptionBorder"))
                        }
                        .matchedGeometryEffect(id: "upgrades\(spellModel.spellName)", in: animation)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 10)
                        .padding(.horizontal, 10)
                    }
                    
                    Spacer()
                }
            }
            .matchedGeometryEffect(id: "allView\(spellModel.spellName)", in: animation)
            .frame(width: 320, height: 480)
            .onAppear {
                withAnimation(.easeInOut(duration: 0.4)){
                    showContent = true
                }
            }
    }
}

struct SpellExtendedCardVIew_Previews: PreviewProvider {
    
    @State static private var spellModel = SpellsAndCharm(spellName: "Accio", type: "Force", cooldown: "8 Seconds", unlock: "Main Quest - Charms Class", description: "Yanks most enemies to you, and pulls ", upgrades: "Also lifts enemies around target into air.", img: "https://firebasestorage.googleapis.com/v0/b/legacy-helper.appspot.com/o/Spells%2Faccio.avif?alt=media&token=0e12d0f8-1db0-4e36-acd6-44499272e023")
    @Namespace static var animation
    
    static var previews: some View {
//        SpellExtendedCardVIew(spellModel: spellModel, animation: animation)
        ContentView()
    }
}
