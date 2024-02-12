//
//  SettingsViewModel.swift
//  CryptoApp
//
//  Created by yulias on 27/12/2023.
//

import SwiftUI

final class SettingsViewModel: ObservableObject {
    
    @Published var showMore = false
    @Published var showCurrencyPicker = false
    @Published var selectedCurrency = MockSettingsData.selectedCurrency
    @Published var maxShownAssets = MockSettingsData.maxShownAssets
    
    private let currencies = MockSettingsData.currencyTypes
    private let step = MockSettingsData.step
    private let maxAssets = MockSettingsData.maxAssets

    func toggleShowMore() {
        withAnimation {
            showMore.toggle()
        }
    }

    func getCurrencies() -> [String] {
        return currencies.map {$0.symbolText}
    }
    
    var stepValue: Int {
        return step
    }
    
   var maxAssetsValue: Int {
        return maxAssets
    }
}
 
