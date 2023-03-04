//
//  DashboardViewModel.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 24-02-23.
//

import Foundation
import SwiftUI

class DashboardViewModel: ObservableObject {
    @Published var isShowMenuButtonTapped = false
    @Published var showSelectedOptionView = true
    @Published var selectedOptionBackgroundTransition = false
    @Published var menuOptions = ["Spells", "Beasts", "Brooms", "Wand Handles", "Potions", "Companions", "Professors", "Challenges", "Enemies"]
    @Published var selectedOption = "Spells"
    @Published var isOptionSelected = false
    
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
        } else {
            withAnimation(.easeOut(duration: 0.5)) {
                self.selectedOptionBackgroundTransition = false
            }
        }
    }
    
    //MARK: - change the state in order to show the navigation menu
    func hideMenuWhenOptionIsSelected() {
        withAnimation(.easeOut(duration: 0.2)) {
            self.selectedOptionBackgroundTransition = true
        }
        
        if self.selectedOptionBackgroundTransition {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.easeOut(duration: 0.3)) {
                    self.isShowMenuButtonTapped.toggle()
                }
            }
        }
    }
}
