//
//  OnboardingScreenViewModel.swift
//  CryptoApp
//
//  Created by yulias on 27.12.23.
//

import SwiftUI

final class OnboardingScreenViewModel: ObservableObject {

    @AppStorage(LocalizedString.isUserOnboarded) var isUserOnboarded: Bool = false

    @Published var selector = 0
    @Published var canGoNext: Bool = false
    @Published var onboardingSlides: [OnboardingSlideModel] = []

    init() {
        onboardingSlides = OnboardingSlidesDataProvider.slides
    }

    var currentSlide: CGFloat {
        return CGFloat(selector + 1)
    }

    var numberOfSlides: CGFloat {
        return CGFloat(onboardingSlides.count)
    }

    var onboardingSlide: OnboardingSlideModel {
        return onboardingSlides[selector]
    }

    func onboardUser() {
        isUserOnboarded = true
    }

    func showNextSlide() {
        if currentSlide == numberOfSlides {
            canGoNext = true
        } else {
            selector += 1
            canGoNext = false
        }
    }

    //MARK: -- UI elements
    var indexGlow: CGFloat {
        return currentSlide == numberOfSlides ? Constants.Layout.animatedIndexGlow : Constants.Layout.notAnimatedIndexGlow
    }

    var arcStroke: CGFloat {
        return currentSlide == numberOfSlides ? Constants.Layout.animatedArcStroke : Constants.Layout.notAnimatedArcStroke
    }

    var chevronSize: CGFloat {
        return currentSlide == numberOfSlides ? Constants.Layout.animatedChevronSize : Constants.Layout.notAnimatedChevronSize
    }

    var circleSize: CGFloat {
        return currentSlide == numberOfSlides ? Constants.Layout.animatedCircleSize : Constants.Layout.notAnimatedCircleSize
    }

    var fontSize: CGFloat {
        return currentSlide == numberOfSlides ? Constants.Layout.animatedFontSize : Constants.Layout.notAnimatedFontSize
    }

    //MARK: -- Navigation
    @ViewBuilder func showTabBar() -> some View {
        TabBarView()
            .navigationBarBackButtonHidden(true)
    }
}

extension OnboardingScreenViewModel {
    private enum Constants {
        enum Layout {
            static let notAnimatedIndexGlow: CGFloat = 0
            static let animatedIndexGlow: CGFloat = 5
            static let notAnimatedArcStroke: CGFloat = 2
            static let animatedArcStroke: CGFloat = 4
            static let notAnimatedChevronSize: CGFloat = 24
            static let animatedChevronSize: CGFloat = 28
            static let notAnimatedCircleSize: CGFloat = 60
            static let animatedCircleSize: CGFloat = 70
            static let animatedFontSize: CGFloat = 28
            static let notAnimatedFontSize: CGFloat = 24
        }
    }
}
