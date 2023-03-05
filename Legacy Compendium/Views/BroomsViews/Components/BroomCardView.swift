//
//  BroomCardView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 04-03-23.
//

import SwiftUI
import Kingfisher

struct BroomCardView: View {
    
    @State var broomModel: Broom
    var animation: Namespace.ID
    
    var body: some View {
        ZStack(alignment: .top) {
            CardBackgroundView()
                .shadow(color: Color(.black).opacity(0.2), radius: 5)
            
            KFImage(URL(string: broomModel.img?.broomLogo ?? ""))
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .matchedGeometryEffect(id: "image\(String(describing: broomModel.broomName))", in: animation)
                .frame(width: 60)
                .offset(y: -30)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("SelectedOptionBorder"), lineWidth: 2)
                        .matchedGeometryEffect(id: "image\(String(describing: broomModel.broomName))border", in: animation)
                        .offset(y: -30)
                )
            
            VStack {
                Text(broomModel.broomName ?? "")
                    .font(.custom("CrimesOfGrindelwald", size: 20))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("SelectedOptionBorder"))
                    .matchedGeometryEffect(id: "broomName\(String(describing: broomModel.broomName))", in: animation)
                    .padding(.top, 25)
                    .padding(.horizontal, 5)
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text(broomModel.description ?? "")
                        .font(.custom("UniversityOldstyleBook", size: 16))
                        .matchedGeometryEffect(id: "description\(String(describing: broomModel.broomName))", in: animation)
                        .foregroundColor(Color("SelectedOptionBorder"))
                        .padding(.bottom, 5)
                }
                .padding(.top, 5)
                .padding(.horizontal, 5)
                
                
            }
            .padding(.top, 15)
            .padding([.bottom, .horizontal], 5)
        }
        .matchedGeometryEffect(id: "allView\(String(describing: broomModel.broomName))", in: animation)
        .padding(.horizontal, 5)
        .frame(height: 230)
        .padding(.vertical, 30)
    }
}

struct BroomCardView_Previews: PreviewProvider {
    
    @Namespace static var animation
    @State static private var broomModel = Broom(broomName: "Aeromancer Broom", location: "Vendor", cost: "Cost: 3000", description: "A smooth ride that cuts through the air like a potioneer slicing ingredients.", img: Img(broomLogo: "https://firebasestorage.googleapis.com/v0/b/legacy-helper.appspot.com/o/Brooms%2FAeromancer%20-%20Logo.png?alt=media&token=5de8368e-98ea-4b30-b3c2-ec3087056358", broomImg: "https://firebasestorage.googleapis.com/v0/b/legacy-helper.appspot.com/o/Brooms%2FAeromancer.png?alt=media&token=af83cf1b-8977-4158-a137-b6af3d7f1c97"))
    
    static var previews: some View {
        BroomCardView(broomModel: broomModel, animation: animation)
    }
}
