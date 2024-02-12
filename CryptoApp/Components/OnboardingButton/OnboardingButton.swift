//
//  OnboardingButton.swift
//  CryptoApp
//
//  Created by yulias on 28.12.23.
//

import SwiftUI

struct OnboardingButton: View {
    
    private enum Constants {
        enum Text {
            static let icon: String = "chevron.right"
        }
        enum Layout {
            static let strokeOpacity: CGFloat = 0.04
            static let strokeLineWidth: CGFloat = 4
            static let outerCirclePadding: CGFloat = -15
            static let trimStartingPoint: CGFloat = 0
        }
        enum Colors {
            static let background = Asset.Colors.fontColor.swiftUIColor
            static let foreground = Asset.Colors.backgroundColor.swiftUIColor
        }
    }
    
    @ObservedObject var viewModel: OnboardingScreenViewModel
    
    var body: some View {
        Button {
            withAnimation(.easeIn) {
                viewModel.showNextSlide()
            }
        } label: {
            Image(systemName: Constants.Text.icon)
                .font(.system(size: viewModel.fontSize, weight: .semibold))
                .foregroundColor(Constants.Colors.foreground)
                .frame(
                    width: viewModel.circleSize,
                    height: viewModel.circleSize
                )
                .background(Constants.Colors.background)
                .clipShape(Circle())
                .shadow(
                    color: .white,
                    radius: viewModel.indexGlow
                )
                .overlay {
                    ZStack {
                        Circle()
                            .stroke(.black.opacity(Constants.Layout.strokeOpacity),lineWidth: Constants.Layout.strokeLineWidth)
                        
                        Circle()
                            .trim(from: Constants.Layout.trimStartingPoint,
                                  to: viewModel.currentSlide / viewModel.numberOfSlides)
                            .stroke(.white, lineWidth: viewModel.arcStroke)
                    }
                    .padding(Constants.Layout.outerCirclePadding)
                }
        }
    }
}
