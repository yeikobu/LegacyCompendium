//
//  LegacyCompendiumVIewModel.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 21-02-23.
//

import Foundation
import SwiftUI

class LegacyCompendiumViewModel: ObservableObject {
    
    @Published var legacyCompendiumModel: LegacyCompendiumModel?
    @Published var isShowMenuButtonTapped = false
    @Published var selectedOptionBackgroundTransition = false
    @Published var menuOptions = ["Home", "Spells", "Beasts", "Brooms", "Wand Handles", "Potions", "Companions", "Professors", "Challenges", "Enemies"]
    @Published var selectedOption = "Home"
    @Published var isOptionSelected = false
    
    func getData() {
        guard let url = Bundle.main.url(forResource: "LegacyCompendiumData", withExtension: "json") else {
            print("Json not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let documents = try? JSONDecoder().decode(LegacyCompendiumModel.self, from: data!)
        print("Documents: \(String(describing: documents))")
        self.legacyCompendiumModel = documents
    }
    
    //MARK: - change the state in order to show the navigation menu
    func changeMenuButtonState() {
        withAnimation(.easeOut(duration: 0.3)) {
            self.isShowMenuButtonTapped.toggle()
        }
        
        if self.isShowMenuButtonTapped {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.easeOut(duration: 0.3)) {
                    self.selectedOptionBackgroundTransition = true
                }
            }
        } else {
            withAnimation(.easeOut(duration: 0.3)) {
                self.selectedOptionBackgroundTransition = false
            }
        }
        
    }
}


