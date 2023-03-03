//
//  PotionsViewModel.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 03-03-23.
//

import Foundation

class PotionsViewModel: LegacyCompendiumViewModel {
    @Published var potions = [Potion]()
    @Published var selectedPotion = Potion(potionName: "", description: "", unlock: "", ingredients: "", img: "")
    
    func getPotions() {
        getData()
        
        legacyCompendiumModel.collections.potions?.forEach { potion in
            self.potions.append(potion)
        }
    }
}
