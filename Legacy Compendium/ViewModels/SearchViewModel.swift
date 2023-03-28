//
//  SearchViewModel.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 27-03-23.
//

import Foundation

class SearchViewModel: LegacyCompendiumViewModel {
    
    @Published var searchedText: String = ""
    @Published var matchedSpells: [SpellsAndCharm] = []
    @Published var matchedPotions: [Potion] = []
    @Published var matchedBeasts: [Beast] = []
    @Published var matchedEnemies: [Enemy] = []
    @Published var matchedWandHandles: [WandHandle] = []
    @Published var matchedBrooms: [Broom] = []
    @Published var matchedCompanions: [Personage] = []
    @Published var matchedProfessors: [Personage] = []
    
    @Published var isCharacter: Bool = false
    
    func search() {
        getData()
        
        removeItems()
        
        legacyCompendiumModel.collections.spellsAndCharms.forEach { spell in
            if spell.spellName.contains(searchedText) || spell.description.contains(searchedText) {
                matchedSpells.append(spell)
            }
        }
        
        legacyCompendiumModel.collections.potions?.forEach { potion in
            if potion.potionName!.contains(searchedText) || potion.description!.contains(searchedText) {
                matchedPotions.append(potion)
            }
        }
        
        legacyCompendiumModel.collections.beasts?.forEach { beast in
            if beast.beastName!.contains(searchedText) ||  beast.description!.contains(searchedText) || beast.findIt!.contains(searchedText) {
                matchedBeasts.append(beast)
            }
        }
        
        legacyCompendiumModel.collections.enemies?.forEach { enemy in
            if enemy.name!.contains(searchedText) || enemy.description!.contains(searchedText) {
                matchedEnemies.append(enemy)
            }
        }
        
        legacyCompendiumModel.collections.wandHandles?.forEach { wandHandle in
            if wandHandle.handleName!.contains(searchedText) || wandHandle.description!.contains(searchedText) {
                matchedWandHandles.append(wandHandle)
            }
        }
        
        legacyCompendiumModel.collections.brooms?.forEach { broom in
            if broom.broomName!.contains(searchedText) || broom.description!.contains(searchedText) {
                matchedBrooms.append(broom)
            }
        }
        
        legacyCompendiumModel.collections.companions?.forEach { companion in
            if companion.name!.contains(searchedText) || companion.description!.contains(searchedText) || companion.biography!.contains(searchedText) || companion.house!.contains(searchedText) {
                matchedCompanions.append(companion)
                isCharacter = true
            }
        }
        
        legacyCompendiumModel.collections.professors?.forEach { professor in
            if professor.name!.contains(searchedText) || professor.description!.contains(searchedText) || professor.biography!.contains(searchedText) || professor.house!.contains(searchedText) {
                matchedProfessors.append(professor)
                isCharacter = true
            }
        }
    }
    
    func removeItems() {
        matchedSpells = []
        matchedPotions = []
        matchedBeasts = []
        matchedEnemies = []
        matchedWandHandles = []
        matchedBrooms = []
        matchedCompanions = []
        matchedProfessors = []
    }
}
