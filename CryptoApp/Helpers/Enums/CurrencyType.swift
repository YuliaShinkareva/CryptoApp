//
//  CurrencyType.swift
//  CryptoApp
//
//  Created by yulias on 08/01/2024.
//

import SwiftUI

enum CurrencyType: String, Equatable, CaseIterable {
    
    case usd, eur, jpy, gbp, btc, eth

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
         case .btc:
             return LocalizedString.bitcoinSign
         case .eth:
             return LocalizedString.ethereumSign
         }
     }
    
    var title: String {
        return self.rawValue.uppercased()
    }
}

