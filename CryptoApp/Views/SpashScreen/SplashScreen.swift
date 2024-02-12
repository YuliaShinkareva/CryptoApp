//
//  SplashScreen.swift
//  CryptoApp
//
//  Created by yulias on 22.12.23.
//

import SwiftUI

struct SplashScreen: View {
    
    private enum Constants {
        enum Text {
            static let bitcoinIcon: String = LocalizedString.splashScreenBitcoinLogo
            static let cryptoApp: String = LocalizedString.splashScreenCryptoapp
        }
        enum Colors {
            static let background = Asset.Colors.backgroundColor.swiftUIColor
            static let fontColor = Asset.Colors.fontColor.swiftUIColor
        }
        enum Layout {
            static let iconWidth: CGFloat = 80
            static let iconHeight: CGFloat = 80
            static let animationDuration: Double = 1.5
            static let animationEnded: Double = 2.5
        }
    }
    
    @ObservedObject var viewModel: SplashScreenViewModel
    
    var body: some View {
            ZStack {
                Constants.Colors.background
                    
                VStack {
                    Image(systemName: Constants.Text.bitcoinIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(
                            width: Constants.Layout.iconWidth,
                            height: Constants.Layout.iconHeight
                        )
                    Text(Constants.Text.cryptoApp)
                            .font(.title2)
                }
                .scaleEffect(viewModel.size)
                .opacity(viewModel.opacity)
                .foregroundColor(Constants.Colors.fontColor)
                .onAppear {
                    withAnimation(.easeIn(duration: Constants.Layout.animationDuration)) {
                        viewModel.performAnimation()
                    }
                }
            }
            .ignoresSafeArea()
            .onAppear {
                //Comment the line to set onboarded status to true
                viewModel.isUserOnboarded = false
                DispatchQueue.main.asyncAfter(deadline: .now() + Constants.Layout.animationEnded) {
                    self.viewModel.animationFinished = true
                }
            }
            .fullScreenCover(isPresented: $viewModel.animationFinished) {
                viewModel.showOnboardingScreen()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen(viewModel: SplashScreenViewModel())
    }
}
