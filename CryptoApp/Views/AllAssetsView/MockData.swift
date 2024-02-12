//
//  MockData.swift
//  CryptoApp
//
//  Created by yulias on 29.12.23.
//

import Foundation

final class MockAssets: ObservableObject {
    
   @Published var assets: [AssetModel] = [
        AssetModel(
            fullName: "Bitcoin",
            shortName: "BTC",
            image: "bitcoinsign",
            price: 42159.24,
            priceChange: 2.48,
            rating: 1
        ),
        
        AssetModel(
            fullName: "Etherium",
            shortName: "ETH",
            image: "suit.diamond.fill",
            price: 2951.04,
            priceChange: -1.13,
            rating: 2
        ),
        
        AssetModel(
            fullName: "Dash",
            shortName: "DSH",
            image: "eraser.fill",
            price: 940.15,
            priceChange: 3.88,
            rating: 12
        ),
        
        AssetModel(
            fullName: "Litecoin",
            shortName: "LTC",
            image: "dollarsign",
            price: 223.24,
            priceChange: -5.22,
            rating: 8
        ),
        
        AssetModel(
            fullName: "ZCash",
            shortName: "ZCH",
            image: "bolt.horizontal.fill",
            price: 300.09,
            priceChange: 0.41,
            rating: 18
        ),
        
        AssetModel(
            fullName: "Doggie",
            shortName: "DOG",
            image: "guaranisign",
            price: 5.11,
            priceChange: 0.09,
            rating: 6
        ),
    ]
    
}
