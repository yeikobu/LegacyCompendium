//
//  BroomsViewModel.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 04-03-23.
//

import Foundation

class BroomsViewModel: LegacyCompendiumViewModel {
    @Published var brooms = [Broom]()
    @Published var selectedBroom = Broom(broomName: "", location: nil, cost: "", description: "", img: nil)
    
    func getBroom() {
        getData()
        
        legacyCompendiumModel.collections.brooms?.forEach { broom in
            self.brooms.append(broom)
        }
    }
}
