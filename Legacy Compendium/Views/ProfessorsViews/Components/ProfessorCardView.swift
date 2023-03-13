//
//  ProfessorCardView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 07-03-23.
//

import SwiftUI
import Kingfisher

struct ProfessorCardView: View {
    
    @State var professorModel: Personage
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
                .frame(width: 50, height: 80)
                .offset(y: -50)
            
            VStack {
                Text(professorModel.name ?? "")
                    .font(.custom("CrimesOfGrindelwald", size: 20))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("SelectedOptionBorder"))
                    .matchedGeometryEffect(id: "proffessorName\(String(describing: professorModel.name))", in: animation)
                    .padding(.top, 25)
                    .padding(.horizontal, 5)
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text(professorModel.description ?? "")
                        .font(.custom("UniversityOldstyleBook", size: 16))
                        .matchedGeometryEffect(id: "description\(String(describing: professorModel.name))", in: animation)
                        .foregroundColor(Color("SelectedOptionBorder"))
                        .padding(.bottom, 5)
                }
                .padding(.top, 5)
                .padding(.horizontal, 5)
                
                
            }
            .padding(.top, 15)
            .padding([.bottom, .horizontal], 5)
        }
        .matchedGeometryEffect(id: "allView\(String(describing: professorModel.name))", in: animation)
        .padding(.horizontal, 5)
        .frame(height: 230)
        .padding(.vertical, 30)
    }
}

struct ProfessorCardView_Previews: PreviewProvider {
    
    @Namespace static var animation
    @State static private var professorModel = Professor(name: "Eleazar Fig", description: "A wizard who teaches Magic Theory at Hogwarts. An essential character throughout your journey as he investigates the mystery of Ranrok's rebellion.", img: "https://firebasestorage.googleapis.com/v0/b/legacy-helper.appspot.com/o/Professors%2FMatilda_Weasley.webp?alt=media&token=6287e1c1-58b3-423b-aa53-e9d13b1c1580")
    
    static var previews: some View {
//        ProfessorCardView(professorModel: professorModel, animation: animation)
        ProfessorsScreenView()
    }
}
