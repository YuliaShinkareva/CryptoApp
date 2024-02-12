//
//  PortfolioViewModel.swift
//  CryptoApp
//
//  Created by yulias on 27/12/2023.
//

import SwiftUI

final class PortfolioViewModel: ObservableObject {
    
    private enum Constants {
        
        enum Colors {
            static let lightBlue = Asset.Colors.triangleLightblueColor.swiftUIColor
            static let lightRed =
            Asset.Colors.triangleLightredColor.swiftUIColor
        }
        
        enum Text {
            static let triangleFillImage = LocalizedString.triangleFillTitle
            static let arrowtriangleDownFilImage = LocalizedString.arrowtriangleDownFillTitle
        }
    }
    
    @Published var totalBalance: Double = 0.0
    @Published var portfolioAssets: [PortfolioModel] = []
    
    init() {
        portfolioAssets = PortfolioMockAssets().portfolioAssets
        calculateTotalBalance()
    }

    func calculateTotalBalance() {
        totalBalance = portfolioAssets.reduce(0) { $0 + $1.quotation }
    }
    
    func formattedQuotation(for portfolio: PortfolioModel) -> String {
        return portfolio.quotation.formattedCurrencyString(currencyType: portfolio.currencyType)
    }
       
    func dynamicsString(for portfolio: PortfolioModel) -> String {
        return (portfolio.dynamics ?? .zero).formattedPercentageString() 
    }
    
    func dynamicsImage(for portfolio: PortfolioModel) -> String {
        let imageSystemName = (portfolio.dynamics ?? .zero) >= .zero ?
        Constants.Text.triangleFillImage : 
        Constants.Text.arrowtriangleDownFilImage
        return imageSystemName
    }
       
   func dynamicsColor(for portfolio: PortfolioModel) -> Color {
       return (portfolio.dynamics ?? .zero) >= .zero ?
       Constants.Colors.lightBlue : Constants.Colors.lightRed
   }
}
 
