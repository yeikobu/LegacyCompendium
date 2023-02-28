//
//  CategoryTitleView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 28-02-23.
//

import SwiftUI

struct CategoryTitleView: View {
    @State var categoryName: String
    
    var body: some View {
        Text(categoryName)
            .font(.custom("CrimesOfGrindelwald", size: 20))
            .foregroundColor(Color("Border"))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
    }
}

struct CategoryTitleView_Previews: PreviewProvider {
    @State static private var categoryName = "CategoryName"
    
    static var previews: some View {
        CategoryTitleView(categoryName: categoryName)
    }
}
