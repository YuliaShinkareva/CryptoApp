//
//  Double.swift
//  CryptoApp
//
//  Created by yulias on 04/01/2024.
//

import SwiftUI

extension Double {
    
        func formattedCurrencyString(currencyType: CurrencyType) -> String {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.currencySymbol = currencyType.symbolText
            formatter.currencyGroupingSeparator = ","
            formatter.currencyDecimalSeparator = "."
            formatter.maximumFractionDigits = 2
            formatter.minimumFractionDigits = 2
            formatter.locale = Locale(identifier: currencyType == .eur ? "fr_FR" : "en_US")
            return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
        }

        func formattedPercentageString() -> String {
            let formatter = NumberFormatter()
            formatter.numberStyle = .percent
            formatter.percentSymbol = "%"
            formatter.multiplier = 1
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
            formatter.decimalSeparator = "."
            return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
        }
}
