//
//  TextStyleView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 21-02-23.
//

import SwiftUI

struct TextStyleView: View {
    
    @State var text: String
    @Binding var isOffsetableScrollViewDraggedUp: Bool
    
    var body: some View {
        ZStack {
            Text(text)
                .font(.custom("CrimesOfGrindelwald", size: isOffsetableScrollViewDraggedUp ? 18 : 32))
                .foregroundColor(Color("Title"))
                .shadow(color:Color(.gray), radius: 1)
                .multilineTextAlignment(.center)
                .overlay(
                    Text(text)
                        .font(.custom("CrimesOfGrindelwald", size: isOffsetableScrollViewDraggedUp ? 17.5 : 31.5))
                        .foregroundColor(Color("Title"))
                        .multilineTextAlignment(.center)
                        .shadow(color:Color(.black), radius: 1)
                )
                .padding(.leading, 20)
        }
    }
}

struct TextStyleView_Previews: PreviewProvider {
    
    @State static var text = "Spells"
    @State static var textSize: CGFloat = 32
    static var previews: some View {
        TextStyleView(text: text, isOffsetableScrollViewDraggedUp: .constant(false))
    }
}
