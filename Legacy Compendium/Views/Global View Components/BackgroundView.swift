//
//  BackgroundView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 20-02-23.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("Background"))
                .ignoresSafeArea()
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
