//
//  MockSettingsData.swift
//  CryptoApp
//
//  Created by yulias on 16/01/2024.
//

import SwiftUI

final class MockSettingsData: ObservableObject {
    
    static let selectedCurrency: CurrencyType = .usd
    static let maxShownAssets = 50
    static let currencyTypes: [CurrencyType] = CurrencyType.allCases
    static let step = 50
    static let maxAssets = 500
}
 
