//
//  TabbedItems.swift
//  CryptoApp
//
//  Created by yulias on 27/12/2023.
//

import SwiftUI

enum TabbedItems: Int, CaseIterable {
    
    private enum Constants {
        
        enum Text {
            static let portfolioTitle = LocalizedString.portfolioTitle
            static let allAssetsTitle = LocalizedString.allAssetsTitle
            static let newsTitle = LocalizedString.newsTitle
            static let settingsTitle = LocalizedString.settingsTitle
        }
    }
    
    case portfolio = 0, allAssets, news, settings
    
    var title: String {
        switch self {
        case .portfolio:
            return Constants.Text.portfolioTitle
        case .allAssets:
            return Constants.Text.allAssetsTitle
        case .news:
            return Constants.Text.newsTitle
        case .settings:
            return Constants.Text.settingsTitle
        }
    }
    
    var iconImage: Image {
        switch self {
        case .portfolio:
            return Asset.Assets.portfolioTabIcon.swiftUIImage
        case .allAssets:
            return Asset.Assets.assetsTabIcon.swiftUIImage
        case .news:
            return Asset.Assets.newsTabIcon.swiftUIImage
        case .settings:
            return Asset.Assets.settingsTabIcon.swiftUIImage
        }
    }
}
