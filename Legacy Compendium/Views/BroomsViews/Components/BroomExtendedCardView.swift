//
//  BroomExtendedCardView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 05-03-23.
//

import SwiftUI
import Kingfisher

struct BroomExtendedCardView: View {
    
    @State var broomModel: Broom
    @Binding var showContent: Bool
    var animation: Namespace.ID
    
    var body: some View {
        ZStack {
            CardBackgroundView()
                .shadow(color: Color(.black).opacity(0.2), radius: 5)
            
            KFImage(URL(string: broomModel.img?.broomLogo ?? ""))
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .matchedGeometryEffect(id: "image\(String(describing: broomModel.broomName))", in: animation)
                .frame(width: 100)
                .offset(y: -240)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("SelectedOptionBorder").opacity(1), lineWidth: 2)
                        .matchedGeometryEffect(id: "image\(String(describing: broomModel.broomName))border", in: animation)
                        .offset(y: -240)
                )
            
            VStack {
                Text(broomModel.broomName ?? "")
                    .font(.custom("CrimesOfGrindelwald", size: 20))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("SelectedOptionBorder"))
                    .matchedGeometryEffect(id: "broomName\(String(describing: broomModel.broomName))", in: animation)
                    .padding(.top, 72)
                    .padding(.horizontal, 5)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Description")
                        .font(.custom("UniversityOldstyleBook", size: 16))
                        .foregroundColor(.gray)
                    
                    Text(broomModel.description ?? "")
                        .font(.custom("UniversityOldstyleBook", size: 16))
                        .matchedGeometryEffect(id: "description\(String(describing: broomModel.broomName))", in: animation)
                        .foregroundColor(Color("SelectedOptionBorder"))
                        .padding(.bottom, 5)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 5)
                .padding(.horizontal, 10)
                
                if showContent {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Location")
                            .font(.custom("UniversityOldstyleBook", size: 16))
                            .foregroundColor(.gray)
                            .opacity(showContent ? 1 : 0)
                        
                        Text(broomModel.location ?? "")
                            .font(.custom("UniversityOldstyleBook", size: 16))
                            .foregroundColor(Color("SelectedOptionBorder"))
                    }
                    .matchedGeometryEffect(id: "unlock\(String(describing: broomModel.broomName))", in: animation)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 10)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Cost")
                            .font(.custom("UniversityOldstyleBook", size: 16))
                            .foregroundColor(.gray)
                            .opacity(showContent ? 1 : 0)
                        
                        Text(broomModel.cost ?? "")
                            .font(.custom("UniversityOldstyleBook", size: 16))
                            .foregroundColor(Color("SelectedOptionBorder"))
                    }
                    .matchedGeometryEffect(id: "upgrades\(String(describing: broomModel.broomName))", in: animation)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 10)
                }
                
                Spacer()
            }
        }
        .matchedGeometryEffect(id: "allView\(String(describing: broomModel.broomName))", in: animation)
        .frame(width: 320, height: 480)
        .onAppear {
            withAnimation(.easeInOut(duration: 0.4)){
                showContent = true
            }
        }
    }
}

struct BroomExtendedCardView_Previews: PreviewProvider {
    
    @Namespace static var animation
    @State static private var broomModel = Broom(broomName: "Aeromancer Broom", location: "Vendor", cost: "Cost: 3000", description: "A smooth ride that cuts through the air like a potioneer slicing ingredients.", img: Img(broomLogo: "https://firebasestorage.googleapis.com/v0/b/legacy-helper.appspot.com/o/Brooms%2FAeromancer%20-%20Logo.png?alt=media&token=5de8368e-98ea-4b30-b3c2-ec3087056358", broomImg: "https://firebasestorage.googleapis.com/v0/b/legacy-helper.appspot.com/o/Brooms%2FAeromancer.png?alt=media&token=af83cf1b-8977-4158-a137-b6af3d7f1c97"))
    
    static var previews: some View {
//        BroomExtendedCardView(broomModel: broomModel, showContent: .constant(true), animation: animation)
        DashboardView(isTransitionActive: .constant(false))
    }
}
