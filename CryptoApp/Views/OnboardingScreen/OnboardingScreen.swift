//
//  OnboardingScreen.swift
//  CryptoApp
//
//  Created by yulias on 26.12.23.
//

import SwiftUI

struct OnboardingScreen: View {
    
    @StateObject var viewModel: OnboardingScreenViewModel
    
    var body: some View {
            ZStack {
                OnboardingBackground()
                
                VStack {
                    Spacer()
                    
                    OnboardingSlide(onboardingSlide: viewModel.onboardingSlide)
                    
                    Spacer()
                }
            }
            .overlay(alignment: .bottom) {
                OnboardingButton(viewModel: viewModel)
            }
            .fullScreenCover(isPresented: $viewModel.canGoNext, content: {
                viewModel.showTabBar()
            })
            .toolbar(.hidden)
            .onDisappear {
                viewModel.onboardUser()
            }
        }
}

struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen(viewModel: OnboardingScreenViewModel())
    }
}
