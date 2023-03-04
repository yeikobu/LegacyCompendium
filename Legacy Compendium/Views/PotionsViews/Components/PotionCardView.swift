//
//  PotionCardView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 03-03-23.
//

import SwiftUI
import Kingfisher

struct PotionCardView: View {
    
    @State var potionModel: Potion
    var animation: Namespace.ID
    
    var body: some View {
        ZStack(alignment: .top) {
            CardBackgroundView()
                .shadow(color: Color(.black).opacity(0.2), radius: 5)
            
            KFImage(URL(string: potionModel.img ?? ""))
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .matchedGeometryEffect(id: "image\(String(describing: potionModel.potionName))", in: animation)
                .frame(width: 60)
                .offset(y: -30)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("SelectedOptionBorder"), lineWidth: 2)
                        .matchedGeometryEffect(id: "image\(String(describing: potionModel.potionName))border", in: animation)
                        .offset(y: -30)
                )
            
            VStack {
                Text(potionModel.potionName ?? "")
                    .font(.custom("CrimesOfGrindelwald", size: 20))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("SelectedOptionBorder"))
                    .matchedGeometryEffect(id: "potionName\(String(describing: potionModel.potionName))", in: animation)
                    .padding(.top, 25)
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
                .padding(.top, 5)
                .padding(.horizontal, 5)
                
                
            }
            .padding(.top, 15)
            .padding([.bottom, .horizontal], 5)
        }
        .matchedGeometryEffect(id: "allView\(String(describing: potionModel.potionName))", in: animation)
        .padding(.horizontal, 5)
        .frame(height: 230)
        .padding(.vertical, 30)
    }
}

struct PotionCardView_Previews: PreviewProvider {
    @Namespace static var animation
    @State static var potionModel = Potion(potionName: "Invisibility POtion", description: "This potion is used to make whoever drinks it invisible for 1 minute", unlock: "Purchase this recipe at J. Pippins Potions - 500G", ingredients: "1x Leaping Toadstool Caps \n1x Knotgrass Sprig \n1x Troll Bogeys", img: "https://firebasestorage.googleapis.com/v0/b/legacy-helper.appspot.com/o/Potions%2FInvisibility.png?alt=media&token=3aa193d1-29e2-4399-9d25-40bdd1012cb0")
    
    static var previews: some View {
        PotionsView()
//        PotionCardView(potionModel: potionModel, animation: animation)
    }
}
