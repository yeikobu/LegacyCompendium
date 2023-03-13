//
//  ProfessorsViewModel.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 07-03-23.
//

import Foundation

class ProfessorsViewModel: LegacyCompendiumViewModel {
    @Published var professors = [Personage]()
    @Published var selectedProfessor = Personage(name: "", house: "", description: "", biography: "", magicalAbilitiesAndSkills: MagicalAbilitiesAndSkills(transfiguration: "", charms: "", dueling: "", wandlessMagic: "", darkArts: "", charismaAndManipulation: "", love: "", parseltongue: "", defenceAgainstTheDarkArts: "", magicalBeasts: "", magicalTheory: "", magizoology: "", auror: "", potions: "", magicalKnowledge: "", herbology: "", flight: "", divination: "", astronomy: ""), img: "")
    
    func getProfessor() {
        getData()
        
        legacyCompendiumModel.collections.professors?.forEach { professor in
            professors.append(professor)
        }
    }
}
