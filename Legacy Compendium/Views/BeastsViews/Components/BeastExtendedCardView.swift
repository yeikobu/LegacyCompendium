//
//  BeastExtendedCardView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 04-03-23.
//

import SwiftUI
import Kingfisher

struct BeastExtendedCardView: View {
    
    @State var beastModel: Beast
    @Binding var showContent: Bool
    var animation: Namespace.ID
    
    var body: some View {
        ZStack {
            CardBackgroundView()
                .shadow(color: Color(.black).opacity(0.2), radius: 5)
            
            KFImage(URL(string: beastModel.img ?? ""))
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .matchedGeometryEffect(id: "image\(String(describing: beastModel.beastName))", in: animation)
                .frame(width: 100)
                .offset(y: -240)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("SelectedOptionBorder").opacity(1), lineWidth: 2)
                        .matchedGeometryEffect(id: "image\(String(describing: beastModel.beastName))border", in: animation)
                        .offset(y: -240)
                )
            
            VStack {
                Text(beastModel.beastName ?? "")
                    .font(.custom("CrimesOfGrindelwald", size: 20))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("SelectedOptionBorder"))
                    .matchedGeometryEffect(id: "beastName\(String(describing: beastModel.beastName))", in: animation)
                    .padding(.top, 72)
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
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 5)
                .padding(.horizontal, 10)
                
                if showContent {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Where to find it")
                            .font(.custom("UniversityOldstyleBook", size: 16))
                            .foregroundColor(.gray)
                            .opacity(showContent ? 1 : 0)
                        
                        Text(beastModel.findIt ?? "")
                            .font(.custom("UniversityOldstyleBook", size: 16))
                            .foregroundColor(Color("SelectedOptionBorder"))
                    }
                    .matchedGeometryEffect(id: "unlock\(String(describing: beastModel.beastName))", in: animation)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 10)
                }
                
                Spacer()
            }
        }
        .matchedGeometryEffect(id: "allView\(String(describing: beastModel.beastName))", in: animation)
        .frame(width: 320, height: 480)
        .onAppear {
            withAnimation(.easeInOut(duration: 0.4)){
                showContent = true
            }
        }
    }
}

struct BeastExtendedCardView_Previews: PreviewProvider {
    
    @State static private var beastModel = Beast(beastName: "Puffskein", description: "Puffskeins are round and fluffy beasts, soft enough to cuddle but tough enough to be thrown around. Puffskeins will eat almost anything, but their favorite meal is bogies. They are common household pets for wizarding families because they are easy to maintain.", findIt: "These little creatures can be found in the Forbidden Forest and the South Hogwarts Region.", img: "https://firebasestorage.googleapis.com/v0/b/legacy-helper.appspot.com/o/Beasts%2FPuffskein.avif?alt=media&token=aa698702-fd72-4d1e-ab95-d0ce5ae2caf0")
    @Namespace static var animation
    
    static var previews: some View {
        BeastExtendedCardView(beastModel: beastModel, showContent: .constant(true), animation: animation)
    }
}
