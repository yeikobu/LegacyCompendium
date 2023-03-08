//
//  EnemyExtendedCardView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 08-03-23.
//

import SwiftUI
import Kingfisher

struct EnemyExtendedCardView: View {
    
    @State var enemyModel: Enemy
    @Binding var showContent: Bool
    var animation: Namespace.ID
    
    var body: some View {
        ZStack {
            CardBackgroundView()
                .shadow(color: Color(.black).opacity(0.2), radius: 5)
            
            KFImage(URL(string: enemyModel.img ?? ""))
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .matchedGeometryEffect(id: "image\(String(describing: enemyModel.name))", in: animation)
                .frame(width: 100)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("SelectedOptionBorder").opacity(1), lineWidth: 2)
                        .matchedGeometryEffect(id: "image\(String(describing: enemyModel.name))border", in: animation)
                )
                .offset(y: -220)
            
            VStack {
                Text(enemyModel.name ?? "")
                    .font(.custom("CrimesOfGrindelwald", size: 20))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("SelectedOptionBorder"))
                    .matchedGeometryEffect(id: "enemyName\(String(describing: enemyModel.name))", in: animation)
                    .padding(.top, 72)
                    .padding(.horizontal, 5)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Description")
                        .font(.custom("UniversityOldstyleBook", size: 16))
                        .foregroundColor(.gray)
                    
                    Text(enemyModel.description ?? "")
                        .font(.custom("UniversityOldstyleBook", size: 16))
                        .matchedGeometryEffect(id: "description\(String(describing: enemyModel.name))", in: animation)
                        .foregroundColor(Color("SelectedOptionBorder"))
                        .padding(.bottom, 5)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 5)
                .padding(.horizontal, 10)
                
                Spacer()
            }
        }
        .matchedGeometryEffect(id: "allView\(String(describing: enemyModel.name))", in: animation)
        .frame(width: 320, height: 430)
        .onAppear {
            withAnimation(.easeInOut(duration: 0.4)){
                showContent = true
            }
        }
    }
}

struct EnemyExtendedCardView_Previews: PreviewProvider {
    
    @Namespace static private var animation
    @State static private var enemyModel = Enemy(name: "Ailsa Travers", description: "Considered to be particularly close friends with Victor Rookwood, Ailsa Travers is all too\ngood at her job as an Ashwinder. Travers has been one of Rookwood's most devoted followers from the beginning and helped Rookwood gain critical footing within Hogsmeade.", img: "https://firebasestorage.googleapis.com/v0/b/legacy-helper.appspot.com/o/Enemies%2FAlisa%20Travers.png?alt=media&token=ad72e37b-f688-4a8e-986c-9a6b7396a7cc")
    
    static var previews: some View {
        EnemyExtendedCardView(enemyModel: enemyModel, showContent: .constant(true), animation: animation)
    }
}
