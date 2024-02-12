//
//  CurrencyType.swift
//  CryptoApp
//
//  Created by yulias on 08/01/2024.
//

import SwiftUI

enum CurrencyType: String, Equatable, CaseIterable {
    
    case eur = "EUR"
    case usd = "USD"
    case jpy = "JPY"
    case gbp = "GBP"
    case bitocoin = "BTC"
    case ethereum = "ETH"

    var symbolText: String {
         switch self {
         case .usd:
             return LocalizedString.usdSign
         case .eur:
             return LocalizedString.eurSign
         case .jpy:
             return LocalizedString.jpySign
         case .gbp:
             return LocalizedString.gbpSign
         case .bitocoin:
             return LocalizedString.bitcoinSign
         case .ethereum:
             return LocalizedString.ethereumSign
         }
     }
}
