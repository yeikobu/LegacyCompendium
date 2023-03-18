//
//  PrivacyView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 18-03-23.
//

import SwiftUI

struct PrivacyView: View {
    
    @State private var isOffsetableScrollViewDraggedUp = false
    @State private var titlesSize: CGFloat = 22
    @State private var textSize: CGFloat = 18
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            OffsettableScrollView(showsIndicator: false) { point in
                if point.y < -20 {
                    withAnimation(.easeOut(duration: 0.3)) {
                        isOffsetableScrollViewDraggedUp = true
                    }
                }
                
                if point.y >= 0 {
                    withAnimation(.easeOut(duration: 0.3)) {
                        isOffsetableScrollViewDraggedUp = false
                    }
                }
            } content: {
                VStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Privacy Policy for Legacy Compendium")
                            .font(.custom("UniversityOldstyleBook", size: titlesSize))
                        
                        Text("At Legacy Compendium, we value and respect the privacy of our users. This privacy policy explains how we handle and protect the personal information we may collect from users of our application in the future.")
                            .font(.custom("UniversityOldstyleBook", size: textSize))
                            .padding(.top, 5)
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Information we may collect in the future")
                            .font(.custom("UniversityOldstyleBook", size: titlesSize))
                        
                        Text("Currently, Legacy Compendium does not collect personal information from users, such as names, email addresses, physical addresses, or other personal information, as the app only presents information and does not require user data input.")
                            .font(.custom("UniversityOldstyleBook", size: textSize))
                            .padding(.top, 5)
                        
                        Text("However, in the future we may request personal information from users, for example, for registration purposes or to provide additional services. If this happens, we will only collect the necessary information and use it only for the specific purposes for which it is collected.")
                            .font(.custom("UniversityOldstyleBook", size: textSize))
                            .padding(.top, 5)
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Kingfisher")
                            .font(.custom("UniversityOldstyleBook", size: titlesSize))
                        
                        Text("Currently, we use the Kingfisher library to present images asynchronously in our application, which allows us to improve the user experience. Kingfisher does not collect personal information from users or store information on our servers.")
                            .font(.custom("UniversityOldstyleBook", size: textSize))
                            .padding(.top, 5)
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Use of information")
                            .font(.custom("UniversityOldstyleBook", size: titlesSize))
                        
                        Text("If in the future we collect personal information from users, we will use it only for the specific purposes for which it is collected. We will not store or share personal information from users with third parties without explicit user consent.")
                            .font(.custom("UniversityOldstyleBook", size: textSize))
                            .padding(.top, 5)
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Security")
                            .font(.custom("UniversityOldstyleBook", size: titlesSize))
                        
                        Text("We will take reasonable security measures to protect the personal information of our users from loss, misuse, unauthorized access, disclosure, alteration, or destruction.")
                            .font(.custom("UniversityOldstyleBook", size: textSize))
                            .padding(.top, 5)
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Changes to the privacy policy")
                            .font(.custom("UniversityOldstyleBook", size: titlesSize))
                        
                        Text("We may update this privacy policy periodically to reflect changes in our privacy practices. We recommend that you review this privacy policy regularly to stay informed of any changes.")
                            .font(.custom("UniversityOldstyleBook", size: textSize))
                            .padding(.top, 5)
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Contact")
                            .font(.custom("UniversityOldstyleBook", size: titlesSize))
                        
                        Text("If you have questions or concerns about this privacy policy, please contact us through: legacycompendium@gmail.com.")
                            .font(.custom("UniversityOldstyleBook", size: textSize))
                            .padding(.top, 5)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .foregroundColor(Color("SelectedOptionBorder"))
                .padding(.top, isOffsetableScrollViewDraggedUp ? 199 : 200)
                .padding(.horizontal, 15)
            }
            
            VStack {
                TextStyleView(text: "Privacy Policy", isOffsetableScrollViewDraggedUp: $isOffsetableScrollViewDraggedUp)
                    .padding(.bottom, 20)
                    .frame(maxWidth: .infinity, alignment: isOffsetableScrollViewDraggedUp ? .center : .leading)
                    .background {
                        if isOffsetableScrollViewDraggedUp {
                            NavBarBackgroundView(isOffsetableScrollViewDraggedUp: $isOffsetableScrollViewDraggedUp)
                        }
                    }
                
                Spacer()
            }
            .padding(.top, isOffsetableScrollViewDraggedUp ? 20 : 100)
        }
    }
}

struct PrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyView()
    }
}
