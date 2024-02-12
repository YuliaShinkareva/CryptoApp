//
//  SplashScreenViewModel.swift
//  CryptoApp
//
//  Created by yulias on 26.12.23.
//

import SwiftUI

final class SplashScreenViewModel: ObservableObject {
    
    @AppStorage(LocalizedString.isUserOnboarded) var isUserOnboarded: Bool = false
    @Published var animationFinished: Bool = false
    @Published var size: CGFloat = Constants.Layout.sizeBeforeAnimation
    @Published var opacity: Double = Constants.Layout.opacityBeforeAnimation
 
    func performAnimation() {
        self.size = Constants.Layout.sizeAfterAnimation
        self.opacity = Constants.Layout.opacityAfterAnimation
    }
    
    //MARK: -- Navigation
    @ViewBuilder func showOnboardingScreen() -> some View {
        if isUserOnboarded {
            TabBarView()
        } else {
            OnboardingScreen(viewModel: OnboardingScreenViewModel())
        }
    }
}

extension SplashScreenViewModel {
    private enum Constants {
        enum Layout {
            static let sizeBeforeAnimation: CGFloat = 0.8
            static let opacityBeforeAnimation: Double = 0.5
            static let sizeAfterAnimation: CGFloat = 1.0
            static let opacityAfterAnimation: Double = 1.0
        }
    }
}
