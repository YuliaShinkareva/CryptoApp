//
//  OnboardingSlidesDataProvider.swift
//  CryptoApp
//
//  Created by yulias on 28.12.23.
//

import Foundation

struct OnboardingSlidesDataProvider {
    static let slides: [OnboardingSlideModel] = [
        OnboardingSlideModel(title: "All Cards Supported",
                             body: "Say goodbye to complicated withdrawal processes and experience the convenience of managing your funds with just a few taps on our user-friendly platform.",
                             image: Asset.Assets.creditCard.swiftUIImage),
    
        OnboardingSlideModel(title: "Crypto Diversity",
                             body: "Our app provides you with an unparalleled selection of 600+ cryptocurrencies to diversify your investment opportunities and unleash your trading potential",
                             image: Asset.Assets.bitcoin.swiftUIImage),
        
        OnboardingSlideModel(title: "Security",
                             body: "Highly secure crypto trading app, designed to protect your digital assets and provide you with peace of mind. Our app ensures the utmost safety of your funds and personal information. ",
                             image: Asset.Assets.security.swiftUIImage)
    ]
}
