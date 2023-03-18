//
//  TermsView.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 18-03-23.
//

import SwiftUI

struct TermsView: View {
    
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
                        Text("1.Intellectual Property Rights \nThe information and data provided on our application, including but not limited to text, images, graphics, videos, and other content, are the property of their respective owners and are subject to their respective intellectual property rights. Our application uses information and data from a wiki, which are provided under the Creative Commons Attribution-ShareAlike 3.0 Unported (CC-BY-SA) license (Creative Commons — Attribution-ShareAlike 3.0 Unported — CC BY-SA 3.0). The information and data obtained from the wiki may be used and shared freely, as long as the terms of the CC-BY-SA license are respected.")
                            .font(.custom("UniversityOldstyleBook", size: textSize))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("2.License to Use \nWe grant you a limited, non-exclusive, non-transferable, and revocable license to use our application for your personal and non-commercial use. You may not use our application for any other purpose without our prior written consent. You acknowledge that the intellectual property rights in the data obtained from the wiki belong to their respective owners, and that our license to use the application does not grant you any rights in such intellectual property rights. If you wish to use the information or data obtained from the wiki in a manner other than permitted by the CC-BY-SA license, you must obtain permission from the respective intellectual property rights holder.")
                            .font(.custom("UniversityOldstyleBook", size: textSize))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("3.Prohibited Conduct \nYou agree not to use our application for any illegal or unauthorized purpose, or in any way that violates these terms and conditions of use. You agree not to modify, distribute, transmit, display, perform, reproduce, publish, license, create derivative works, transfer or sell any information, software, products or services obtained from or through our application, except to the extent permitted by the CC-BY-SA license.")
                            .font(.custom("UniversityOldstyleBook", size: textSize))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("4.Limitation of Liability \nWe are not responsible for any damage or loss arising from the use of our application, including but not limited to direct, indirect, incidental, punitive, and consequential damages. We do not warrant the accuracy or completeness of any information or content provided by our application, including the data obtained from the wiki.")
                            .font(.custom("UniversityOldstyleBook", size: textSize))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("5.Indemnification \nYou agree to indemnify us and hold us harmless from any claim, damages, or expenses arising from your use of our application or any violation of these terms and conditions of use.")
                            .font(.custom("UniversityOldstyleBook", size: textSize))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("6.Termination \nWe reserve the right to terminate your license to use our application at any time, for any reason, without prior notice.")
                            .font(.custom("UniversityOldstyleBook", size: textSize))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("7.Modifications \nWe reserve the right to modify these terms and conditions of use at any time. Your continued use of our application after any modification to these terms and conditions will constitute your acceptance of the modified terms and conditions.")
                            .font(.custom("UniversityOldstyleBook", size: textSize))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 30) {
                        Text("8.Governing Law \nThese terms and conditions of use are governed by and construed in accordance with the laws of the jurisdiction where we are located, without giving effect to any principles of conflicts of law.")
                            .font(.custom("UniversityOldstyleBook", size: textSize))
                        
                        Text("9.Dispute Resolution \nAny disputes arising from or related to these terms and conditions of use or your use of our application shall be resolved through binding arbitration in accordance with the rules of the arbitration association in the jurisdiction where we are located.")
                            .font(.custom("UniversityOldstyleBook", size: textSize))
                        
                        Text("10.Entire Agreement \nThese terms and conditions of use constitute the entire agreement between you and us regarding your use of our application, and supersede any prior agreements or understandings, whether written or oral.")
                            .font(.custom("UniversityOldstyleBook", size: textSize))
                        
                        Text("11.Severability \nIf any provision of these terms and conditions of use is found to be invalid or unenforceable, the remaining provisions shall remain in full force and effect.")
                            .font(.custom("UniversityOldstyleBook", size: textSize))
                        
                        Text("12.Waiver \nOur failure to enforce any provision of these terms and conditions of use shall not be deemed a waiver of such provision or of the right to enforce such provision.")
                            .font(.custom("UniversityOldstyleBook", size: textSize))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .foregroundColor(Color("SelectedOptionBorder"))
                .padding(.top, isOffsetableScrollViewDraggedUp ? 199 : 200)
                .padding(.horizontal, 15)
            }
            
            VStack {
                TextStyleView(text: "Terms of use", isOffsetableScrollViewDraggedUp: $isOffsetableScrollViewDraggedUp)
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

struct TermsView_Previews: PreviewProvider {
    static var previews: some View {
        TermsView()
    }
}
