//
//  WandHandleCardView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 05-03-23.
//

import SwiftUI
import Kingfisher

struct WandHandleCardView: View {
    @State var wandHandleModel: WandHandle
    var animation: Namespace.ID
    
    var body: some View {
        ZStack(alignment: .top) {
            
            KFImage(URL(string: wandHandleModel.img ?? ""))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(30)
                .matchedGeometryEffect(id: "image\(String(describing: wandHandleModel.handleName))", in: animation)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color("SelectedOptionBorder"), lineWidth: 2)
                        .matchedGeometryEffect(id: "image\(String(describing: wandHandleModel.handleName))border", in: animation)
                )
                .frame(height: 250)
                .offset(y: -95)
            
            VStack {
                Text(wandHandleModel.handleName ?? "")
                    .font(.custom("CrimesOfGrindelwald", size: 20))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("SelectedOptionBorder"))
                    .matchedGeometryEffect(id: "handleName\(String(describing: wandHandleModel.handleName))", in: animation)
                    .padding(.top, 190)
                    .padding(.horizontal, 5)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(wandHandleModel.description ?? "")
                        .font(.custom("UniversityOldstyleBook", size: 16))
                        .matchedGeometryEffect(id: "description\(String(describing: wandHandleModel.handleName))", in: animation)
                        .foregroundColor(Color("SelectedOptionBorder"))
                        .padding(.bottom, 5)
                }
                .padding(.top, 5)
                .padding(.horizontal, 5)
                
                Spacer()
                
            }
            .padding([.bottom, .horizontal], 5)
        }
        .matchedGeometryEffect(id: "allView\(String(describing: wandHandleModel.handleName))", in: animation)
        .frame(width: 300, height: 320)
        .background {
            CardBackgroundView()
        }
        .padding(.top, 100)
    }
}

struct WandHandleCardView_Previews: PreviewProvider {
    
    @Namespace private static var animation
    @State private static var wandHandleModel = WandHandle(handleName: "Shell - Metallic", description: "An unconventional, twisted handle design in marbled lilac.", img: "https://firebasestorage.googleapis.com/v0/b/legacy-helper.appspot.com/o/WandHandles%2FBotanical%20-%20Bronze%20Leaf.webp?alt=media&token=5bf7d3dc-3d69-4ac0-9136-caeefd19428a")
    
    static var previews: some View {
//        WandHandleCardView(wandHandleModel: wandHandleModel, animation: animation)
        WandHandlesScreenView()
    }
}
