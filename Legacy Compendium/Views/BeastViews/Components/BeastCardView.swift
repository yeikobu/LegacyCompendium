//
//  BeastCardView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 04-03-23.
//

import SwiftUI
import Kingfisher

struct BeastCardView: View {
    @State var beastModel: Beast
    var animation: Namespace.ID
    
    var body: some View {
        ZStack(alignment: .top) {
            CardBackgroundView()
                .shadow(color: Color(.black).opacity(0.2), radius: 5)
            
            KFImage(URL(string: beastModel.img ?? ""))
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .matchedGeometryEffect(id: "image\(String(describing: beastModel.beastName))", in: animation)
                .frame(width: 60)
                .offset(y: -30)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("SelectedOptionBorder"), lineWidth: 2)
                        .matchedGeometryEffect(id: "image\(String(describing: beastModel.beastName))border", in: animation)
                        .offset(y: -30)
                )
            
            VStack {
                Text(beastModel.beastName ?? "")
                    .font(.custom("CrimesOfGrindelwald", size: 20))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("SelectedOptionBorder"))
                    .matchedGeometryEffect(id: "beastName\(String(describing: beastModel.beastName))", in: animation)
                    .padding(.top, 25)
                    .padding(.horizontal, 5)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Description")
                        .font(.custom("UniversityOldstyleBook", size: 16))
                        .foregroundColor(.gray)
                    
                    Text(beastModel.description ?? "")
                        .font(.custom("UniversityOldstyleBook", size: 16))
                        .matchedGeometryEffect(id: "description\(String(describing: beastModel.beastName))", in: animation)
                        .foregroundColor(Color("SelectedOptionBorder"))
                        .padding(.bottom, 5)
                }
                .padding(.top, 5)
                .padding(.horizontal, 5)
                
                
            }
            .padding(.top, 15)
            .padding([.bottom, .horizontal], 5)
        }
        .matchedGeometryEffect(id: "allView\(String(describing: beastModel.beastName))", in: animation)
        .padding(.horizontal, 5)
        .frame(height: 230)
        .padding(.vertical, 30)
    }
}

struct BeastCardView_Previews: PreviewProvider {
    
    @State static private var beastModel = Beast(beastName: "Puffskein", description: "Puffskeins are round and fluffy beasts, soft enough to cuddle but tough enough to be thrown around. Puffskeins will eat almost anything, but their favorite meal is bogies. They are common household pets for wizarding families because they are easy to maintain.", findIt: "These little creatures can be found in the Forbidden Forest and the South Hogwarts Region.", img: "https://firebasestorage.googleapis.com/v0/b/legacy-helper.appspot.com/o/Beasts%2FPuffskein.avif?alt=media&token=aa698702-fd72-4d1e-ab95-d0ce5ae2caf0")
    @Namespace static var animation
    
    static var previews: some View {
        BeastCardView(beastModel: beastModel, animation: animation)
    }
}
