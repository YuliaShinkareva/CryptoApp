//
//  SortModel.swift
//  CryptoApp
//
//  Created by yulias on 9.01.24.
//

import SwiftUI

enum SortTypes: String, CaseIterable {
    case price, name, rating, change, none
    
    var title: String {
        return self.rawValue.capitalized
    }
    
}

struct SortModel: Identifiable {
    let id = UUID()
    let sortType: SortTypes
    var isAscending: Bool = false
    
    var arrowImage: Image {
        let triangleIcon = isAscending ? Image(systemName: Constants.Text.upIcon) : Image(systemName: Constants.Text.downIcon)
        return sortType != .none ? triangleIcon : Constants.Images.emptyImage
    }
    
    var arrowColor: Color {
        return isAscending ? Asset.Colors.triangleLightblueColor.swiftUIColor : Asset.Colors.triangleLightredColor.swiftUIColor
    }
    
    var fontColor: Color {
        return sortType != .none ? Constants.Colors.fontColor : Constants.Colors.lightRedColor
    }
    
    var deviderOpacity: CGFloat {
        sortType != .none ? Constants.Layout.dividerOpacity : Constants.Layout.dividerNoOpacity
    }
    
    var fontWeight: Font.Weight {
        sortType != .none ? .medium : .semibold
    }
    
}

extension SortModel {
    private enum Constants {
        enum Text {
            static let upIcon: String = LocalizedString.arrowtriangleUpFillIcon
            static let downIcon: String = LocalizedString.arrowtriangleDownFillTitle
        }
        enum Colors {
            static let fontColor = Asset.Colors.fontColor.swiftUIColor.opacity(0.8)
            static let lightRedColor = Asset.Colors.triangleLightredColor.swiftUIColor
        }
        enum Layout {
            static let dividerNoOpacity: CGFloat = 0
            static let dividerOpacity: CGFloat = 0.5
        }
        enum Images {
            static let emptyImage: Image = Image(uiImage: UIImage())
        }
    }
}
