//
//  AllAssetsViewModel.swift
//  CryptoApp
//
//  Created by yulias on 5.01.24.
//

import SwiftUI

final class AllAssetsViewModel: ObservableObject {
    
    @Published var arrayOfAssets: [AssetModel] = MockAssets().assets
    @Published var userInput: String = ""
    @Published var sortMenuShowing: Bool = false
    @Published var sortFramePosition: CGRect = .zero
    
    private let data = MockAssets().assets
    var sortCases: [SortModel] = []
    
    init(){
        let sortTypes: [SortTypes] = SortTypes.allCases
        for sortType in sortTypes {
            sortCases.append(SortModel(sortType: sortType))
        }
    }
    
    var blurRadius: CGFloat {
        sortMenuShowing ? Constants.Layout.viewBlur : .zero
    }
    
    var dropdownMenuOpacity: CGFloat {
        sortMenuShowing ? Constants.Layout.dropdownMenuOpacity : .zero
    }
    
    var dropdownXPosition: CGFloat {
        sortFramePosition.origin.x + Constants.Layout.dropdownXPosition
    }
    
    var dropdownYPosition: CGFloat {
        sortFramePosition.origin.y + Constants.Layout.dropdownYPosition
    }
    
    var dropdownXOffset: CGFloat {
        sortMenuShowing ? Constants.Layout.dropdownXOffset : .zero
    }
    
    var dropdownYOffset: CGFloat {
        sortMenuShowing ? Constants.Layout.dropdownYOffset : .zero
    }
    
    func checkUserInput() {
        if userInput == "" {
            arrayOfAssets = data
        } else {
            arrayOfAssets = data.filter{$0.fullName.contains(userInput)}
        }
    }
    
    func sortAssets (by sortType: SortTypes, isAscending: Bool) {
        switch sortType {
        case .price:
            isAscending ? arrayOfAssets.sort {$0.price > $1.price} : arrayOfAssets.sort {$0.price < $1.price}
        case .name:
            isAscending ? arrayOfAssets.sort {$0.fullName > $1.fullName} : arrayOfAssets.sort {$0.fullName < $1.fullName}
        case .rating:
            isAscending ? arrayOfAssets.sort {$0.rating > $1.rating} : arrayOfAssets.sort {$0.rating < $1.rating}
        case .change:
            isAscending ? arrayOfAssets.sort {$0.priceChange > $1.priceChange} : arrayOfAssets.sort {$0.priceChange < $1.priceChange }
        case .none:
            arrayOfAssets = data
        }
    }
    
    func dismissSortMenu() {
        sortMenuShowing = false
    }
    
}

extension AllAssetsViewModel {
    private enum Constants {
        enum Layout {
            static let viewBlur: CGFloat = 5
            static let dropdownMenuOpacity: CGFloat = 1
            static let dropdownXPosition: CGFloat = 60
            static let dropdownYPosition: CGFloat = 120
            static let dropdownXOffset: CGFloat = -30
            static let dropdownYOffset: CGFloat = 20
        }
    }
}
