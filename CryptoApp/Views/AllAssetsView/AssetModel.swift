//
//  AssetModel.swift
//  CryptoApp
//
//  Created by yulias on 29.12.23.
//

import SwiftUI

struct AssetModel: Identifiable {
    let id = UUID()
    let fullName: String
    let shortName: String
    let image: String
    let price: Double
    let priceChange: Double
    let rating: Int
    
    var priceChangeColor: Color {
        priceChange < .zero ?
        Constants.Colors.lightRed :
        Constants.Colors.lightBlue
    }
    
    var priceChangeIcon: Image {
        priceChange < .zero ?
        Image(systemName: Constants.Text.downIcon) :
        Image(systemName: Constants.Text.upIcon)
    }
    
    var priceFormated: String {
        return price.formattedCurrencyString(currencyType: .usd)
    }
    
    var priceChangeFormated: String {
        return priceChange.formattedPercentageString()
    }
    
    var ratingFormated: String {
        return "#\(rating)"
    }
}

extension AssetModel {
    private enum Constants {
        enum Text {
            static let upIcon: String = LocalizedString.arrowtriangleUpFillIcon
            static let downIcon: String = LocalizedString.arrowtriangleDownFillTitle
        }
        enum Colors {
            static let lightBlue = Asset.Colors.triangleLightblueColor.swiftUIColor
            static let lightRed = Asset.Colors.triangleLightredColor.swiftUIColor
        }
    }
}
