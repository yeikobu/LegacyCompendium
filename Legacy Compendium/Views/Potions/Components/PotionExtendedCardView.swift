//
//  PotionExtendedCardView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 03-03-23.
//

import SwiftUI
import Kingfisher

struct PotionExtendedCardView: View {
    @State var potionModel: Potion
    @Binding var showContent: Bool
    var animation: Namespace.ID
    
    var body: some View {
        ZStack {
            CardBackgroundView()
                .shadow(color: Color(.black).opacity(0.2), radius: 5)
            
            KFImage(URL(string: potionModel.img ?? ""))
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .matchedGeometryEffect(id: "image\(String(describing: potionModel.potionName))", in: animation)
                .frame(width: 100)
                .offset(y: -240)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("SelectedOptionBorder").opacity(1), lineWidth: 2)
                        .matchedGeometryEffect(id: "image\(String(describing: potionModel.potionName))border", in: animation)
                        .offset(y: -240)
                )
            
            VStack {
                Text(potionModel.potionName ?? "")
                    .font(.custom("CrimesOfGrindelwald", size: 20))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("SelectedOptionBorder"))
                    .matchedGeometryEffect(id: "potionName\(String(describing: potionModel.potionName))", in: animation)
                    .padding(.top, 72)
                    .padding(.horizontal, 5)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Description")
                        .font(.custom("UniversityOldstyleBook", size: 16))
                        .foregroundColor(.gray)
                    
                    Text(potionModel.description ?? "")
                        .font(.custom("UniversityOldstyleBook", size: 16))
                        .matchedGeometryEffect(id: "description\(String(describing: potionModel.potionName))", in: animation)
                        .foregroundColor(Color("SelectedOptionBorder"))
                        .padding(.bottom, 5)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 5)
                .padding(.horizontal, 10)
                
                if showContent {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("How to get")
                            .font(.custom("UniversityOldstyleBook", size: 16))
                            .foregroundColor(.gray)
                            .opacity(showContent ? 1 : 0)
                        
                        Text(potionModel.unlock ?? "")
                            .font(.custom("UniversityOldstyleBook", size: 16))
                            .foregroundColor(Color("SelectedOptionBorder"))
                    }
                    .matchedGeometryEffect(id: "unlock\(String(describing: potionModel.potionName))", in: animation)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 10)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Ingredients")
                            .font(.custom("UniversityOldstyleBook", size: 16))
                            .foregroundColor(.gray)
                            .opacity(showContent ? 1 : 0)
                        
                        Text(potionModel.ingredients ?? "")
                            .font(.custom("UniversityOldstyleBook", size: 16))
                            .foregroundColor(Color("SelectedOptionBorder"))
                    }
                    .matchedGeometryEffect(id: "upgrades\(String(describing: potionModel.potionName))", in: animation)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 10)
                }
                
                Spacer()
            }
        }
        .matchedGeometryEffect(id: "allView\(String(describing: potionModel.potionName))", in: animation)
        .frame(width: 320, height: 480)
        .onAppear {
            withAnimation(.easeInOut(duration: 0.4)){
                showContent = true
            }
        }
    }
}

struct PotionExtendedCardView_Previews: PreviewProvider {
    
    @Namespace static var animation
    @State static var potionModel = Potion(potionName: "Invisibility POtion", description: "This potion is used to make whoever drinks it invisible for 1 minute", unlock: "Purchase this recipe at J. Pippins Potions - 500G", ingredients: "1x Leaping Toadstool Caps \n1x Knotgrass Sprig \n1x Troll Bogeys", img: "https://firebasestorage.googleapis.com/v0/b/legacy-helper.appspot.com/o/Potions%2FInvisibility.png?alt=media&token=3aa193d1-29e2-4399-9d25-40bdd1012cb0")
    
    static var previews: some View {
//        PotionExtendedCardView(potionModel: potionModel, showContent: .constant(true), animation: animation)
        PotionsView()
    }
}
