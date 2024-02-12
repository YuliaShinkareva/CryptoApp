//
//  PortfolioMockAssets.swift
//  CryptoApp
//
//  Created by yulias on 03/01/2024.
//

import Foundation

final class PortfolioMockAssets: ObservableObject {
    
    enum Constants {
        
        enum Text {
            static let bitcoinFullName = LocalizedString.bitcoinFullName
            static let bitcoinShortName = LocalizedString.bitcoinShortName
            static let ethereumFullName = LocalizedString.ethereumFullName
            static let ethereumShortName = LocalizedString.ethereumShortName
            static let litecoinFullName = LocalizedString.litecoinFullName
            static let litecoinShortName = LocalizedString.bitcoinShortName
            static let eosFullName = LocalizedString.eosFullName
            static let eosShortName = LocalizedString.eosShortName
        }
        
        enum Layout {
            static let bitcoinQuotation: CGFloat = 192473.48
            static let bitcoinDynamics: CGFloat = -2.48
            static let ethereumQuotation: CGFloat = 35744.36
            static let ethereumDynamics: CGFloat = 6.26
            static let litecoinQuotation: CGFloat = 28538.42
            static let litecoinDynamics: CGFloat = 5.27
            static let eosQuotation: CGFloat = 6739.32
            static let eosDynamics: CGFloat = 9.33
        }
    }
    
    @Published var portfolioAssets: [PortfolioModel] = [
        PortfolioModel(
            cryptoImage: Asset.Assets.bitcoinPortfolioIcon.swiftUIImage,
            cryptoName: Constants.Text.bitcoinFullName,
            shortCryptoName: Constants.Text.bitcoinShortName,
            quotation: Constants.Layout.bitcoinQuotation,
            dynamics: Constants.Layout.bitcoinDynamics,
            currencyType: .usd
        ),

        PortfolioModel(
            cryptoImage: Asset.Assets.ethereumPortfolioIcon.swiftUIImage,
            cryptoName: Constants.Text.ethereumFullName,
            shortCryptoName: Constants.Text.ethereumShortName,
            quotation: Constants.Layout.ethereumQuotation,
            dynamics: Constants.Layout.ethereumDynamics,
            currencyType: .usd
        ),
        
        PortfolioModel(
             cryptoImage: Asset.Assets.litecoinPortfolioIcon.swiftUIImage,
             cryptoName: Constants.Text.litecoinFullName,
             shortCryptoName: Constants.Text.litecoinShortName,
             quotation: Constants.Layout.litecoinQuotation,
             dynamics: Constants.Layout.litecoinDynamics,
             currencyType: .usd
        ),
        
        PortfolioModel(
             cryptoImage: Asset.Assets.eosPortfolioIcon.swiftUIImage,
             cryptoName: Constants.Text.eosFullName,
             shortCryptoName: Constants.Text.eosShortName,
             quotation: Constants.Layout.eosQuotation,
             dynamics: Constants.Layout.eosDynamics,
             currencyType: .usd
        )
    ]
}
 
