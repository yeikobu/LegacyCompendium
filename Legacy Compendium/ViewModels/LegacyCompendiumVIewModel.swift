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
    @Published var showSelectedOptionView = true
    @Published var selectedOptionBackgroundTransition = false
    @Published var menuOptions = ["Home", "Spells", "Beasts", "Brooms", "Wand Handles", "Potions", "Companions", "Professors", "Challenges", "Enemies"]
    @Published var selectedOption = "Home"
    @Published var isOptionSelected = false
    
    //MARK: - Get data from local JSON
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
    func showOrHideMenuWhenButtonIsTapped() {
        withAnimation(.easeOut(duration: 0.3)) {
            self.isShowMenuButtonTapped.toggle()
        }
        
        if self.isShowMenuButtonTapped {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.easeOut(duration: 0.5)) {
                    self.selectedOptionBackgroundTransition = true
                }
            }
            
//            withAnimation(.easeOut(duration: 0.3)) {
//                self.showSelectedOptionView = false
//            }
        } else {
            withAnimation(.easeOut(duration: 0.5)) {
                self.selectedOptionBackgroundTransition = false
            }
            
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                withAnimation(.easeOut(duration: 0.5)) {
//                    self.showSelectedOptionView = true
//                }
//            }
        }
    }
    
    //MARK: - change the state in order to show the navigation menu
    func hideMenuWhenOptionIsSelected() {
        withAnimation(.easeOut(duration: 0.2)) {
            self.selectedOptionBackgroundTransition = true
        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            withAnimation(.easeOut(duration: 0.3)) {
//                self.showSelectedOptionView = true
//            }
//        }
        
        if self.selectedOptionBackgroundTransition {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.easeOut(duration: 0.3)) {
                    self.isShowMenuButtonTapped.toggle()
                }
            }
        }
    }
    
}


