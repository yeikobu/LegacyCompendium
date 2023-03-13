//
//  CompanionsViewModel.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 06-03-23.
//

import Foundation

class CompanionsViewModel: LegacyCompendiumViewModel {
    @Published var companios = [Personage]()
    @Published var selectedCompanion = Personage(name: "", house: "", description: "", biography: "", magicalAbilitiesAndSkills: MagicalAbilitiesAndSkills(transfiguration: "", charms: "", dueling: "", wandlessMagic: "", darkArts: "", charismaAndManipulation: "", love: "", parseltongue: "", defenceAgainstTheDarkArts: "", magicalBeasts: "", magicalTheory: "", magizoology: "", auror: "", potions: "", magicalKnowledge: "", herbology: "", flight: "", divination: "", astronomy: ""), img: "")
    
    func getCompanion() {
        getData()
        
        legacyCompendiumModel.collections.companions?.forEach { companion in
            self.companios.append(companion)
        }
    }
}
