//
//  LegacyCompendiumVIewModel.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 21-02-23.
//

import Foundation

class LegacyCompendiumViewModel: ObservableObject {
    
    @Published var legacyCompendiumModel: LegacyCompendiumModel?
    
    //MARK: - Get data from local JSON
    func getData() {
        guard let url = Bundle.main.url(forResource: "LegacyCompendiumData", withExtension: "json") else {
            print("Json not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let documents = try? JSONDecoder().decode(LegacyCompendiumModel.self, from: data!)
        self.legacyCompendiumModel = documents
        print(self.legacyCompendiumModel!)
    }
    
}


