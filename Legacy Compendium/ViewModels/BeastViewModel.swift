//
//  BeastViewModel.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 04-03-23.
//

import Foundation

class BeastsViewModel: LegacyCompendiumViewModel {
    @Published var beasts = [Beast]()
    @Published var selectedBeast = Beast(beastName: "", description: "", findIt: "", img: "")
    
    func getBeast() {
        getData()
        
        legacyCompendiumModel.collections.beasts?.forEach { beast in
            self.beasts.append(beast)
        }
    }
}
