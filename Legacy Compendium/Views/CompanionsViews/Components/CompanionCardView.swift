//
//  CompanionCardView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 06-03-23.
//

import SwiftUI
import Kingfisher

struct CompanionCardView: View {
    @State var companionModel: Personage
    var animation: Namespace.ID
    
    var body: some View {
        ZStack(alignment: .top) {
            CardBackgroundView()
                .shadow(color: Color(.black).opacity(0.2), radius: 5)
            
            KFImage(URL(string: companionModel.img ?? ""))
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .matchedGeometryEffect(id: "image\(String(describing: companionModel.name))", in: animation)
                .frame(width: 60, height: 80)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("SelectedOptionBorder"), lineWidth: 2)
                        .matchedGeometryEffect(id: "image\(String(describing: companionModel.name))border", in: animation)
                )
                .offset(y: -50)
            
            VStack {
                Text(companionModel.name ?? "")
                    .font(.custom("CrimesOfGrindelwald", size: 20))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("SelectedOptionBorder"))
                    .matchedGeometryEffect(id: "companionName\(String(describing: companionModel.name))", in: animation)
                    .padding(.top, 25)
                    .padding(.horizontal, 5)
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text(companionModel.description ?? "")
                        .font(.custom("UniversityOldstyleBook", size: 16))
                        .matchedGeometryEffect(id: "description\(String(describing: companionModel.name))", in: animation)
                        .foregroundColor(Color("SelectedOptionBorder"))
                        .padding(.bottom, 5)
                }
                .padding(.top, 5)
                .padding(.horizontal, 5)
                
                
            }
            .padding(.top, 15)
            .padding([.bottom, .horizontal], 5)
        }
        .matchedGeometryEffect(id: "allView\(String(describing: companionModel.name))", in: animation)
        .padding(.horizontal, 5)
        .frame(height: 230)
        .padding(.vertical, 30)
    }
}

struct CompanionCardView_Previews: PreviewProvider {
    
//    @Namespace static private var animation
//    @State static private var companionModel = Companion(name: "Natsai Onai", house: "Gryffindor", description: "Natsai Onai was an African witch who attended Hogwarts School of Witchcraft and Wizardry in the 19th century and was sorted into Gryffindor house. Her mother was a professor of Divination.", biography: "As an only child, she grew up in Matabeleland, Africa, with a tribe, wandering the Matobo Hills with her father who was a giraffe Animagus, and watching her mother use divination to help protect their tribe from less-than-friendly neighbours. Her father was killed protecting her by local bandits when she was nine years old. She and her mother later moved to Uganda where she attended Uagadou. During such time, she learned to be an Animagus, learning to transform into a gazelle. Just before her fourth year, she transferred to Hogwarts when her mother took up a role as professor of Divination. She had to learn how to use a wand at Hogwarts, as hardly anyone at Uagadou used one, and Natsai still found wandless magic to be more instinctive and convenient. \n\nDuring the 1890–1891 school year, she choose to take Ancient Runes as an elective class, although in fact her mother had elected it for her. \n\nOn 2 September 1890, when the new fifth-year student arrived to Charms class, she invited them to sit beside her.", magicalAbilitiesAndSkills: MagicalAbilitiesAndSkills(transfiguration: "Transfiguration: Natsai became an Animagus at a young age, and was able to assume the form of a gazelle spontaneously. She could also perform the Boggart-Banishing Spell on a Boggart by transforming it into a cat.", charms: "Charms: Natsai was able to perform the Summoning Charm quite effortlessly.", dueling: "Natsai was highly talented in duelling and was capable in taking multiple opponents such as her fellow students in the Crossed Wands Dueling Club as well as the subordinates of Victor Rookwood and Theophilus Harlow.", wandlessMagic: "Natsai was able to perform wandless magic during her years at Uagadou.", darkArts: nil, charismaAndManipulation: nil, love: nil, parseltongue: nil, defenceAgainstTheDarkArts: nil, magicalBeasts: nil), img: "https://firebasestorage.googleapis.com/v0/b/legacy-helper.appspot.com/o/Companions%2FNatsai_Onai.webp?alt=media&token=3db51bba-de28-4854-a5ce-d74a697209ad")
    
    static var previews: some View {
//        CompanionCardView(companionModel: companionModel, animation: animation)
        CompanionsScreenView()
    }
}
