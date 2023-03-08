//
//  EnemyCardView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 08-03-23.
//

import SwiftUI
import Kingfisher

struct EnemyCardView: View {
    
    @State var enemyModel: Enemy
    var animation: Namespace.ID
    
    var body: some View {
        ZStack(alignment: .top) {
            CardBackgroundView()
                .shadow(color: Color(.black).opacity(0.2), radius: 5)
            
            KFImage(URL(string: enemyModel.img ?? ""))
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .matchedGeometryEffect(id: "image\(String(describing: enemyModel.name))", in: animation)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("SelectedOptionBorder"), lineWidth: 2)
                        .matchedGeometryEffect(id: "image\(String(describing: enemyModel.name))border", in: animation)
                )
                .offset(y: -50)
                .frame(width: 80, height: 80)
            
            VStack {
                Text(enemyModel.name ?? "")
                    .font(.custom("CrimesOfGrindelwald", size: 20))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("SelectedOptionBorder"))
                    .matchedGeometryEffect(id: "enemyName\(String(describing: enemyModel.name))", in: animation)
                    .padding(.top, 25)
                    .padding(.horizontal, 5)
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text(enemyModel.description ?? "")
                        .font(.custom("UniversityOldstyleBook", size: 16))
                        .matchedGeometryEffect(id: "description\(String(describing: enemyModel.name))", in: animation)
                        .foregroundColor(Color("SelectedOptionBorder"))
                        .padding(.bottom, 5)
                }
                .padding(.top, 5)
                .padding(.horizontal, 5)
                
                
            }
            .padding(.top, 15)
            .padding([.bottom, .horizontal], 5)
        }
        .matchedGeometryEffect(id: "allView\(String(describing: enemyModel.name))", in: animation)
        .padding(.horizontal, 5)
        .frame(height: 230)
        .padding(.vertical, 30)
    }
}

struct EnemyCardView_Previews: PreviewProvider {
    
    @Namespace static private var animation
    @State static private var enemyModel = Enemy(name: "Ailsa Travers", description: "Considered to be particularly close friends with Victor Rookwood, Ailsa Travers is all too\ngood at her job as an Ashwinder. Travers has been one of Rookwood's most devoted followers from the beginning and helped Rookwood gain critical footing within Hogsmeade.", img: "https://firebasestorage.googleapis.com/v0/b/legacy-helper.appspot.com/o/Enemies%2FAlisa%20Travers.png?alt=media&token=ad72e37b-f688-4a8e-986c-9a6b7396a7cc")
    
    static var previews: some View {
        EnemyCardView(enemyModel: enemyModel, animation: animation)
    }
}
