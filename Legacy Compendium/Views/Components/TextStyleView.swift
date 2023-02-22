//
//  TextStyleView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 21-02-23.
//

import SwiftUI

struct TextStyleView: View {
    
    @StateObject var legacyCompendiumViewModel = LegacyCompendiumViewModel()
    @State var text: String
    @Binding var textSize: CGFloat
    
    var body: some View {
        ZStack {
            Text(text)
                .font(.custom("CrimesOfGrindelwald", size: textSize))
                .foregroundColor(Color("Title"))
                .shadow(color:Color(.gray), radius: 1)
                .multilineTextAlignment(.center)
                .overlay(
                    Text(text)
                        .font(.custom("CrimesOfGrindelwald", size: textSize - 0.5))
                        .foregroundColor(Color("Title"))
                        .multilineTextAlignment(.center)
                        .shadow(color:Color(.black), radius: 1)
                )
        }
    }
}

struct TextStyleView_Previews: PreviewProvider {
    
    @State static var text = "Spells"
    @State static var textSize: CGFloat = 32
    static var previews: some View {
        TextStyleView(text: text, textSize: $textSize)
    }
}
