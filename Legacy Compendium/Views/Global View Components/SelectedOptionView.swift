//
//  SelectedOptionView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 21-02-23.
//

import SwiftUI

struct SelectedOptionView: View {
    
    var animation: Namespace.ID
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(.ultraThinMaterial).blur(radius: 0)
                .blur(radius: 0)
                .opacity(0.85)
            
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color("Background"))
                .blur(radius: 0)
                .opacity(0.85)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("SelectedOptionBorder"), lineWidth: 3)
                )
                .shadow(color: Color("Title").opacity(0.1), radius: 20)
        }
        .frame(maxHeight: 60)
        .padding(.horizontal, 30)
        .matchedGeometryEffect(id: "selectedOptionView", in: animation)
    }
}

struct SelectedOptionView_Previews: PreviewProvider {
    @Namespace static var animation
    
    static var previews: some View {
        SelectedOptionView(animation: animation)
            .preferredColorScheme(.dark)
    }
}
