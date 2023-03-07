//
//  ProfessorsViewModel.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 07-03-23.
//

import Foundation

class ProfessorsViewModel: LegacyCompendiumViewModel {
    @Published var professors = [Professor]()
    @Published var selectedProfessor = Professor(name: "", description: "", img: "")
    
    func getProfessor() {
        getData()
        
        legacyCompendiumModel.collections.professors?.forEach { professor in
            professors.append(professor)
        }
    }
}
