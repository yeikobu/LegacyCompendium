//
//  CompanionsViewModel.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 06-03-23.
//

import Foundation

class CompanionsViewModel: LegacyCompendiumViewModel {
    @Published var companios = [Companion]()
    @Published var selectedCompanion = Companion(name: "", house: "", description: "", biography: "", magicalAbilitiesAndSkills: MagicalAbilitiesAndSkills(transfiguration: "", charms: "", dueling: "", wandlessMagic: "", darkArts: "", charismaAndManipulation: "", love: "", parseltongue: "", defenceAgainstTheDarkArts: "", magicalBeasts: ""), img: "")
    
    func getCompanion() {
        getData()
        
        legacyCompendiumModel.collections.companions?.forEach { companion in
            self.companios.append(companion)
        }
    }
}
