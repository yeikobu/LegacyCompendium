//
//  SpellsViewModel.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 27-02-23.
//

import Foundation

class SpellsViewModel: LegacyCompendiumViewModel {
    @Published var essentialSpells = [SpellsAndCharm]()
    @Published var damageSpells = [SpellsAndCharm]()
    @Published var controlSpells = [SpellsAndCharm]()
    @Published var forceSpells = [SpellsAndCharm]()
    @Published var utilitySpells = [SpellsAndCharm]()
    @Published var curseSpells = [SpellsAndCharm]()
    
    func getSpellsByType() {
        getData()
        
        legacyCompendiumModel.collections.spellsAndCharms.forEach { spell in
            if spell.type.contains("Essential") {
                essentialSpells.append(spell)
            }
            
            if spell.type.contains("Damage") {
                damageSpells.append(spell)
            }
            
            if spell.type.contains("Control") {
                controlSpells.append(spell)
            }
            
            if spell.type.contains("Force") {
                forceSpells.append(spell)
            }
            
            if spell.type.contains("Utility") {
                forceSpells.append(spell)
            }
            
            if spell.type.contains("Curse") {
                curseSpells.append(spell)
            }
        }
    }
}
