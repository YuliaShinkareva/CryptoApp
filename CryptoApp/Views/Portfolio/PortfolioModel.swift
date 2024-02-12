//
//  PortfolioModel.swift
//  CryptoApp
//
//  Created by yulias on 27/12/2023.
//

import SwiftUI

struct PortfolioModel: Identifiable {
    
    let id = UUID()
    let cryptoImage: Image
    let cryptoName: String
    let shortCryptoName: String
    var quotation: Double
    var dynamics: Double?
    var currencyType: CurrencyType
}

