//
//  NavBarBackgroundView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 27-02-23.
//

import SwiftUI

struct NavBarBackgroundView: View {
    
    @Binding var isOffsetableScrollViewDraggedUp: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0, style: .continuous)
                .fill(.ultraThinMaterial)
                .blur(radius: 0)
                .opacity(0.85)
            
            RoundedRectangle(cornerRadius: 0, style: .continuous)
                .fill(Color("Card"))
                .blur(radius: 0)
                .opacity(0.85)
        }
        .frame(maxWidth: .infinity, maxHeight: 400)
        .padding(.top, -240)
        .padding(.horizontal, -20)
        .opacity(isOffsetableScrollViewDraggedUp ? 1 : 0)
        .shadow(color: Color(.black).opacity(1), radius: 5)
    }
}

struct NavBarBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarBackgroundView(isOffsetableScrollViewDraggedUp: .constant(false))
    }
}
