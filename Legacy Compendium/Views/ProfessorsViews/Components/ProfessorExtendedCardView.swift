//
//  ProfessorExtendedCardView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 09-03-23.
//

import SwiftUI
import Kingfisher

struct ProfessorExtendedCardView: View {
    
    @State var professorModel: Personage
    @Binding var showContent: Bool
    @Binding var isProfessorSelected: Bool
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
        .matchedGeometryEffect(id: "allView\(String(describing: professorModel.name))", in: animation)
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
            
            KFImage(URL(string: professorModel.img ?? ""))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "image\(String(describing: professorModel.name))", in: animation)
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
                            .matchedGeometryEffect(id: "image\(String(describing: professorModel.name))border", in: animation)
                        
                        VStack(spacing: 0) {
                            Text(professorModel.name ?? "")
                                .font(.custom("CrimesOfGrindelwald", size: 45))
                                .foregroundColor(Color("Title"))
                                .matchedGeometryEffect(id: "companionName\(String(describing: professorModel.name))", in: animation)
                                .shadow(color:Color(.gray), radius: 1)
                                .multilineTextAlignment(.center)
                                .overlay(
                                    Text(professorModel.name ?? "")
                                        .font(.custom("CrimesOfGrindelwald", size: 44.5))
                                        .foregroundColor(Color("Title"))
                                        .matchedGeometryEffect(id: "companionName\(String(describing: professorModel.name))", in: animation)
                                        .multilineTextAlignment(.center)
                                        .shadow(color:Color(.black), radius: 1)
                                )
                                .padding(.leading, 20)
                                .multilineTextAlignment(.center)
                            
//                            Text(professorModel.house ?? "")
//                                .font(.custom("CrimesOfGrindelwald", size: 20))
//                                .foregroundColor(Color("Border"))
//                                .padding(.top,15)
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
                        isProfessorSelected = false
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
                TextStyleView(text: professorModel.name ?? "", isOffsetableScrollViewDraggedUp: .constant(true))
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
            Text(professorModel.description ?? "")
                .font(.custom("UniversityOldstyleBook", size: 16))
                .matchedGeometryEffect(id: "description\(String(describing: professorModel.name))", in: animation)
                .foregroundColor(Color("SelectedOptionBorder"))
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Biography")
                .font(.custom("UniversityOldstyleBook", size: 16))
                .foregroundColor(.gray)
                .padding(.bottom, 1)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text(professorModel.biography ?? "")
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
                        if professorModel.magicalAbilitiesAndSkills?.transfiguration != nil {
                            Text(professorModel.magicalAbilitiesAndSkills?.transfiguration ?? "")
                                .font(.custom("UniversityOldstyleBook", size: 16))
                                .foregroundColor(Color("SelectedOptionBorder"))
                                .padding(.bottom, 5)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }

                        if professorModel.magicalAbilitiesAndSkills?.charms != nil {
                            Text(professorModel.magicalAbilitiesAndSkills?.charms ?? "")
                                .font(.custom("UniversityOldstyleBook", size: 16))
                                .foregroundColor(Color("SelectedOptionBorder"))
                                .padding(.bottom, 5)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }

                        if professorModel.magicalAbilitiesAndSkills?.dueling != nil {
                            Text(professorModel.magicalAbilitiesAndSkills?.dueling ?? "")
                                .font(.custom("UniversityOldstyleBook", size: 16))
                                .foregroundColor(Color("SelectedOptionBorder"))
                                .padding(.bottom, 5)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }

                        if professorModel.magicalAbilitiesAndSkills?.wandlessMagic != nil {
                            Text(professorModel.magicalAbilitiesAndSkills?.wandlessMagic ?? "")
                                .font(.custom("UniversityOldstyleBook", size: 16))
                                .foregroundColor(Color("SelectedOptionBorder"))
                                .padding(.bottom, 5)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }

                        if professorModel.magicalAbilitiesAndSkills?.darkArts != nil {
                            Text(professorModel.magicalAbilitiesAndSkills?.darkArts ?? "")
                                .font(.custom("UniversityOldstyleBook", size: 16))
                                .foregroundColor(Color("SelectedOptionBorder"))
                                .padding(.bottom, 5)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }

                    VStack {
                        if professorModel.magicalAbilitiesAndSkills?.charismaAndManipulation != nil {
                            Text(professorModel.magicalAbilitiesAndSkills?.charismaAndManipulation ?? "")
                                .font(.custom("UniversityOldstyleBook", size: 16))
                                .foregroundColor(Color("SelectedOptionBorder"))
                                .padding(.bottom, 5)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }

                        if professorModel.magicalAbilitiesAndSkills?.love != nil {
                            Text(professorModel.magicalAbilitiesAndSkills?.charismaAndManipulation ?? "")
                                .font(.custom("UniversityOldstyleBook", size: 16))
                                .foregroundColor(Color("SelectedOptionBorder"))
                                .padding(.bottom, 5)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }

                        if professorModel.magicalAbilitiesAndSkills?.parseltongue != nil {
                            Text(professorModel.magicalAbilitiesAndSkills?.parseltongue ?? "")
                                .font(.custom("UniversityOldstyleBook", size: 16))
                                .foregroundColor(Color("SelectedOptionBorder"))
                                .padding(.bottom, 5)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }

                        if professorModel.magicalAbilitiesAndSkills?.defenceAgainstTheDarkArts != nil {
                            Text(professorModel.magicalAbilitiesAndSkills?.defenceAgainstTheDarkArts ?? "")
                                .font(.custom("UniversityOldstyleBook", size: 16))
                                .foregroundColor(Color("SelectedOptionBorder"))
                                .padding(.bottom, 5)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }

                        if professorModel.magicalAbilitiesAndSkills?.magicalBeasts != nil {
                            Text(professorModel.magicalAbilitiesAndSkills?.magicalBeasts ?? "")
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

struct ProfessorExtendedCardView_Previews: PreviewProvider {
    
    @Namespace static var animation
    @State static private var professorModel = Professor(name: "Eleazar Fig", description: "A wizard who teaches Magic Theory at Hogwarts. An essential character throughout your journey as he investigates the mystery of Ranrok's rebellion.", img: "https://firebasestorage.googleapis.com/v0/b/legacy-helper.appspot.com/o/Professors%2FMatilda_Weasley.webp?alt=media&token=6287e1c1-58b3-423b-aa53-e9d13b1c1580")
    
    static var previews: some View {
//        ProfessorExtendedCardView(professorModel: professorModel, showContent: .constant(true), animation: animation)
        ProfessorsScreenView()
    }
}
