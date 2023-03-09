//
//  ProfessorExtendedCardView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 09-03-23.
//

import SwiftUI
import Kingfisher

struct ProfessorExtendedCardView: View {
    
    @State var professorModel: Professor
    @Binding var showContent: Bool
    var animation: Namespace.ID
    
    var body: some View {
        ZStack(alignment: .top) {
            CardBackgroundView()
                .shadow(color: Color(.black).opacity(0.2), radius: 5)
            
            KFImage(URL(string: professorModel.img ?? ""))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(10)
                .matchedGeometryEffect(id: "image\(String(describing: professorModel.name))", in: animation)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("SelectedOptionBorder"), lineWidth: 2)
                        .matchedGeometryEffect(id: "image\(String(describing: professorModel.name))border", in: animation)
                )
//                .frame(maxWidth: 30, maxHeight: 80)
                .frame(width: 100, height: 100)
                .offset(y: -70)
            
            VStack {
                Text(professorModel.name ?? "")
                    .font(.custom("CrimesOfGrindelwald", size: 20))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("SelectedOptionBorder"))
                    .matchedGeometryEffect(id: "proffessorName\(String(describing: professorModel.name))", in: animation)
                    .padding(.top, 45)
                    .padding(.horizontal, 5)
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text(professorModel.description ?? "")
                        .font(.custom("UniversityOldstyleBook", size: 16))
                        .matchedGeometryEffect(id: "description\(String(describing: professorModel.name))", in: animation)
                        .foregroundColor(Color("SelectedOptionBorder"))
                        .padding(.bottom, 5)
                }
                .padding(.top, 10)
                .padding(.horizontal, 10)
                
                
            }
        }
        .matchedGeometryEffect(id: "allView\(String(describing: professorModel.name))", in: animation)
        .frame(width: 320, height: 400)
        .padding(.vertical, 30)
    }
}

struct ProfessorExtendedCardView_Previews: PreviewProvider {
    
    @Namespace static var animation
    @State static private var professorModel = Professor(name: "Eleazar Fig", description: "A wizard who teaches Magic Theory at Hogwarts. An essential character throughout your journey as he investigates the mystery of Ranrok's rebellion.", img: "https://firebasestorage.googleapis.com/v0/b/legacy-helper.appspot.com/o/Professors%2FMatilda_Weasley.webp?alt=media&token=6287e1c1-58b3-423b-aa53-e9d13b1c1580")
    
    static var previews: some View {
        ProfessorExtendedCardView(professorModel: professorModel, showContent: .constant(true), animation: animation)
    }
}
