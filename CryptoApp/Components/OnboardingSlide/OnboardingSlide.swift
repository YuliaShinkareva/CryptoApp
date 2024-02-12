//
//  OnboardingSlide.swift
//  CryptoApp
//
//  Created by yulias on 27.12.23.
//

import SwiftUI

struct OnboardingSlide: View {
    
    private enum Constants {
        enum Layout {
            static let mainVStackSpacing: CGFloat = 36
            static let secondaryVStackSpacing: CGFloat = 12
            static let imageHeight: CGFloat = 150
            static let topPadding: CGFloat = 16
            static let bottomPadding: CGFloat = 16
            static let horizontalPadding: CGFloat = 20
            static let bodyTextOpacity: CGFloat = 0.7
            static let shadowRadius: CGFloat = 3.0
            static let shadowXOffset: CGFloat = 2
            static let shadowYOffset: CGFloat = 3
        }
        
        enum Colors {
            static let fontColor = Asset.Colors.fontColor.swiftUIColor
        }
    }
    
    let onboardingSlide: OnboardingSlideModel
    
    var body: some View {
        VStack(spacing: Constants.Layout.mainVStackSpacing) {
                onboardingSlide.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: Constants.Layout.imageHeight)
                    .shadow(
                        color: .black,
                        radius: Constants.Layout.shadowRadius,
                        x: Constants.Layout.shadowXOffset,
                        y: Constants.Layout.shadowYOffset
                    )
                    .padding(.top, Constants.Layout.topPadding)
                    .padding(.horizontal, Constants.Layout.horizontalPadding)

            VStack(spacing: Constants.Layout.secondaryVStackSpacing) {
                Text(onboardingSlide.title)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            
                Text(onboardingSlide.body)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .opacity(Constants.Layout.bodyTextOpacity)
                }
                .foregroundColor(Constants.Colors.fontColor)
                .padding(.bottom, Constants.Layout.bottomPadding)
                .padding(.horizontal, Constants.Layout.horizontalPadding)
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
            .ignoresSafeArea()
    }
}
