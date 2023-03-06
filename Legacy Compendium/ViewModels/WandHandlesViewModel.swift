//
//  WandHandlesViewModel.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 05-03-23.
//

import Foundation

class WandHandlesViewModel: LegacyCompendiumViewModel {
    @Published var wandHandles = [WandHandle]()
    @Published var selectedWandHandle = WandHandle(handleName: "", description: "", img: "")
    
    func getWandHandles() {
        getData()
        
        legacyCompendiumModel.collections.wandHandles?.forEach { wandHandle in
            self.wandHandles.append(wandHandle)
        }
    }
}
