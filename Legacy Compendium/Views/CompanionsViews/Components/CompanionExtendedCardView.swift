//
//  CompanionExtendedCardView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 06-03-23.
//

import SwiftUI
import Kingfisher

struct CompanionExtendedCardView: View {
    @State var companionModel: Personage
    @Binding var showContent: Bool
    @Binding var isCompanionSelected: Bool
    var animation: Namespace.ID
    var safeArea: EdgeInsets
    var size: CGSize
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ArtWork()
                
                InformationView()
                    .padding(.top,10)
                    .zIndex(0)

            }
            .overlay(alignment: .top) {
                HeaderView()
                
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color("SelectedOptionBorder"), lineWidth: 0)
            }
        }
        .background(Color("Card"))
        .matchedGeometryEffect(id: "allView\(String(describing: companionModel.name))", in: animation)
        .coordinateSpace(name: "SCROLL")
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.easeInOut(duration: 0.4)){
                showContent = true
            }
        }
    }
    
    @ViewBuilder
    func ArtWork() -> some View {
        let height = size.height * 0.45
        
        GeometryReader { proxy in
            let size = proxy.size
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
            
            KFImage(URL(string: companionModel.img ?? ""))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "image\(String(describing: companionModel.name))", in: animation)
                .frame(width: size.width, height: size.height + (minY > 0 ? minY : 0))
                .clipped()
                .overlay {
                    ZStack(alignment: .bottom) {
                        // MARK: Gradient Overlay
                        Rectangle()
                            .fill(
                                .linearGradient(colors: [
                                    Color("Card").opacity(0 - progress),
                                    Color("Card").opacity(0.1 - progress),
                                    Color("Card").opacity(0.3 - progress),
                                    Color("Card").opacity(0.5 - progress),
                                    Color("Card").opacity(0.8 - progress),
                                    Color("Card").opacity(1),
                                ], startPoint: .top, endPoint: .bottom)
                            )
                        
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("SelectedOptionBorder"), lineWidth: 0)
                            .matchedGeometryEffect(id: "image\(String(describing: companionModel.name))border", in: animation)
                        
                        VStack(spacing: 0) {
                            Text(companionModel.name ?? "")
                                .font(.custom("CrimesOfGrindelwald", size: 45))
                                .foregroundColor(Color("Title"))
                                .matchedGeometryEffect(id: "companionName\(String(describing: companionModel.name))", in: animation)
                                .shadow(color:Color(.gray), radius: 1)
                                .multilineTextAlignment(.center)
                                .overlay(
                                    Text(companionModel.name ?? "")
                                        .font(.custom("CrimesOfGrindelwald", size: 44.5))
                                        .foregroundColor(Color("Title"))
                                        .matchedGeometryEffect(id: "companionName\(String(describing: companionModel.name))", in: animation)
                                        .multilineTextAlignment(.center)
                                        .shadow(color:Color(.black), radius: 1)
                                )
                                .padding(.leading, 20)
                                .multilineTextAlignment(.center)
                            
                            Text(companionModel.house ?? "")
                                .font(.custom("CrimesOfGrindelwald", size: 20))
                                .foregroundColor(Color("Border"))
                                .padding(.top,15)
                        }
                        .opacity(1 + (progress > 0 ? -progress : progress))
                        .padding(.bottom,55)
                        // Moving With ScrollView
                        .offset(y: minY < 0 ? minY : 0)
//                        .onChange(of: minY) { yPoint in
//                            if yPoint > 140 {
//                                withAnimation(.easeIn(duration: 0.3)) {
//                                    isCompanionSelected = false
//                                }
//
//                                withAnimation(.easeIn(duration: 0.3)) {
//                                    showContent = false
//                                }
//                            }
//
//                            print(yPoint)
//                        }
                    }
                }
                .offset(y: -minY)
        }
        .frame(height: height + safeArea.top)
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        GeometryReader { proxy in
            
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let height = size.height * 0.45
            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
            let titleProgress = minY / height
            
            HStack(spacing: 15) {
                Spacer(minLength: 0)
                
                Button {
                    withAnimation(.easeIn(duration: 0.3)) {
                        isCompanionSelected = false
                    }
                    
                    withAnimation(.easeIn(duration: 0.3)) {
                        showContent = false
                    }
                } label: {
                    VStack {
                        Image(systemName: "xmark")
                            .foregroundColor(Color("Border"))
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                    }
                    .padding(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color("Border"), lineWidth: 0.5)
                            .padding(4)
                    )
                    .background {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .fill(.ultraThinMaterial).blur(radius: 0)
                                .blur(radius: 0)
                                .opacity(0.5)
                            
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .fill(Color("Buttons"))
                                .blur(radius: 0)
                                .opacity(0.85)
                        }
                    }
                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color("Border"), lineWidth: 4))
                    .cornerRadius(40)
                    .shadow(color: Color("Title").opacity(0.2), radius:20)
                }
            }
            .overlay {
                TextStyleView(text: companionModel.name ?? "", isOffsetableScrollViewDraggedUp: .constant(true))
                    // Your Choice Where to display the title
                    .offset(y: -titleProgress > 0.75 ? 0 : 45)
                    .clipped()
                    .animation(.easeInOut(duration: 0.25), value: -titleProgress > 0.75)
            }
            .padding(.top,safeArea.top + 10)
            .padding([.horizontal,.bottom],15)
            .background(content: {
                NavBarBackgroundView(isOffsetableScrollViewDraggedUp: .constant(true))
                    .opacity(-progress > 1 ? 1 : 0)
            })
            .offset(y: -minY)
        }
        .frame(height: 35)
    }
    
    @ViewBuilder
    func InformationView() -> some View {
        VStack {
            Text(companionModel.description ?? "")
                .font(.custom("UniversityOldstyleBook", size: 16))
                .matchedGeometryEffect(id: "description\(String(describing: companionModel.name))", in: animation)
                .foregroundColor(Color("SelectedOptionBorder"))
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Biography")
                .font(.custom("UniversityOldstyleBook", size: 16))
                .foregroundColor(.gray)
                .padding(.bottom, 1)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(companionModel.biography ?? "")
                .font(.custom("UniversityOldstyleBook", size: 16))
                .foregroundColor(Color("SelectedOptionBorder"))
                .padding(.bottom, 30)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if showContent {
                Text("Magical habilities and skills")
                    .font(.custom("UniversityOldstyleBook", size: 16))
                    .foregroundColor(.gray)
                    .padding(.bottom, 1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    VStack {
                        if companionModel.magicalAbilitiesAndSkills?.transfiguration != nil {
                            Text(companionModel.magicalAbilitiesAndSkills?.transfiguration ?? "")
                                .font(.custom("UniversityOldstyleBook", size: 16))
                                .foregroundColor(Color("SelectedOptionBorder"))
                                .padding(.bottom, 5)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        if companionModel.magicalAbilitiesAndSkills?.charms != nil {
                            Text(companionModel.magicalAbilitiesAndSkills?.charms ?? "")
                                .font(.custom("UniversityOldstyleBook", size: 16))
                                .foregroundColor(Color("SelectedOptionBorder"))
                                .padding(.bottom, 5)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        if companionModel.magicalAbilitiesAndSkills?.dueling != nil {
                            Text(companionModel.magicalAbilitiesAndSkills?.dueling ?? "")
                                .font(.custom("UniversityOldstyleBook", size: 16))
                                .foregroundColor(Color("SelectedOptionBorder"))
                                .padding(.bottom, 5)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        if companionModel.magicalAbilitiesAndSkills?.wandlessMagic != nil {
                            Text(companionModel.magicalAbilitiesAndSkills?.wandlessMagic ?? "")
                                .font(.custom("UniversityOldstyleBook", size: 16))
                                .foregroundColor(Color("SelectedOptionBorder"))
                                .padding(.bottom, 5)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        if companionModel.magicalAbilitiesAndSkills?.darkArts != nil {
                            Text(companionModel.magicalAbilitiesAndSkills?.darkArts ?? "")
                                .font(.custom("UniversityOldstyleBook", size: 16))
                                .foregroundColor(Color("SelectedOptionBorder"))
                                .padding(.bottom, 5)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    
                    VStack {
                        if companionModel.magicalAbilitiesAndSkills?.charismaAndManipulation != nil {
                            Text(companionModel.magicalAbilitiesAndSkills?.charismaAndManipulation ?? "")
                                .font(.custom("UniversityOldstyleBook", size: 16))
                                .foregroundColor(Color("SelectedOptionBorder"))
                                .padding(.bottom, 5)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        if companionModel.magicalAbilitiesAndSkills?.love != nil {
                            Text(companionModel.magicalAbilitiesAndSkills?.charismaAndManipulation ?? "")
                                .font(.custom("UniversityOldstyleBook", size: 16))
                                .foregroundColor(Color("SelectedOptionBorder"))
                                .padding(.bottom, 5)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        if companionModel.magicalAbilitiesAndSkills?.parseltongue != nil {
                            Text(companionModel.magicalAbilitiesAndSkills?.parseltongue ?? "")
                                .font(.custom("UniversityOldstyleBook", size: 16))
                                .foregroundColor(Color("SelectedOptionBorder"))
                                .padding(.bottom, 5)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        if companionModel.magicalAbilitiesAndSkills?.defenceAgainstTheDarkArts != nil {
                            Text(companionModel.magicalAbilitiesAndSkills?.defenceAgainstTheDarkArts ?? "")
                                .font(.custom("UniversityOldstyleBook", size: 16))
                                .foregroundColor(Color("SelectedOptionBorder"))
                                .padding(.bottom, 5)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        if companionModel.magicalAbilitiesAndSkills?.magicalBeasts != nil {
                            Text(companionModel.magicalAbilitiesAndSkills?.magicalBeasts ?? "")
                                .font(.custom("UniversityOldstyleBook", size: 16))
                                .foregroundColor(Color("SelectedOptionBorder"))
                                .padding(.bottom, 5)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
                .padding(.bottom, 40)
            }
        }
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct CompanionExtendedCardView_Previews: PreviewProvider {
    @Namespace static private var animation
//    @State static private var companionModel = Personage(name: "", house: "", description: "", biography: "", magicalAbilitiesAndSkills: MagicalAbilitiesAndSkills(transfiguration: "", charms: "", dueling: "", wandlessMagic: "", darkArts: "", charismaAndManipulation: "", love: "", parseltongue: "", defenceAgainstTheDarkArts: "", magicalBeasts: "", magicalTheory: "", magizoology: "", auror: "", potions: "", magicalKnowledge: "", herbology: "", flight: "", divination: "", astronomy: ""), img: "")(name: "Natsai Onai", house: "Gryffindor", description: "Natsai Onai was an African witch who attended Hogwarts School of Witchcraft and Wizardry in the 19th century and was sorted into Gryffindor house. Her mother was a professor of Divination.", biography: "As an only child, she grew up in Matabeleland, Africa, with a tribe, wandering the Matobo Hills with her father who was a giraffe Animagus, and watching her mother use divination to help protect their tribe from less-than-friendly neighbours. Her father was killed protecting her by local bandits when she was nine years old. She and her mother later moved to Uganda where she attended Uagadou. During such time, she learned to be an Animagus, learning to transform into a gazelle. Just before her fourth year, she transferred to Hogwarts when her mother took up a role as professor of Divination. She had to learn how to use a wand at Hogwarts, as hardly anyone at Uagadou used one, and Natsai still found wandless magic to be more instinctive and convenient. \n\nDuring the 1890–1891 school year, she choose to take Ancient Runes as an elective class, although in fact her mother had elected it for her. \n\nOn 2 September 1890, when the new fifth-year student arrived to Charms class, she invited them to sit beside her.", magicalAbilitiesAndSkills: MagicalAbilitiesAndSkills(transfiguration: "Transfiguration: Natsai became an Animagus at a young age, and was able to assume the form of a gazelle spontaneously. She could also perform the Boggart-Banishing Spell on a Boggart by transforming it into a cat.", charms: "Charms: Natsai was able to perform the Summoning Charm quite effortlessly.", dueling: "Natsai was highly talented in duelling and was capable in taking multiple opponents such as her fellow students in the Crossed Wands Dueling Club as well as the subordinates of Victor Rookwood and Theophilus Harlow.", wandlessMagic: "Natsai was able to perform wandless magic during her years at Uagadou.", darkArts: nil, charismaAndManipulation: nil, love: nil, parseltongue: nil, defenceAgainstTheDarkArts: nil, magicalBeasts: nil, magicalTheory: nil, magizoology: nil, auror: nil, potions: nil, magicalKnowledge: nil, herbology: nil, flight: nil, divination: nil, astronomy: nil), img: "https://firebasestorage.googleapis.com/v0/b/legacy-helper.appspot.com/o/Companions%2FNatsai_Onai.webp?alt=media&token=3db51bba-de28-4854-a5ce-d74a697209ad")
    
    static var previews: some View {
//        GeometryReader {
//            let safeArea = $0.safeAreaInsets
//            let size = $0.size
//            CompanionExtendedCardView(companionModel: companionModel, showContent: .constant(true), isCompanionSelected: .constant(true), animation: animation, safeArea: safeArea, size: size)
//        }
//        .preferredColorScheme(.dark)
        CompanionsScreenView()
    }
}
