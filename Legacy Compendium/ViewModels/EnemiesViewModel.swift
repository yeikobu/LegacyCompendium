//
//  EnemiesViewModel.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 08-03-23.
//

import Foundation

class EnemiesViewModel: LegacyCompendiumViewModel {
    @Published var enemies = [Enemy]()
    @Published var selectedEnemy = Enemy(name: "", description: "", img: "")
    
    func getEnemies() {
        getData()
        
        legacyCompendiumModel.collections.enemies?.forEach { enemy in
            enemies.append(enemy)
        }
    }
}
