//
//  AssetsRow.swift
//  CryptoApp
//
//  Created by yulias on 29.12.23.
//

import SwiftUI

struct AssetsRow: View {
    
    private enum Constants {
        enum Layout {
            static let horizontalSpacing: CGFloat = 30
            static let verticalSpacing: CGFloat = 6
            static let imageWidth: CGFloat = 44
            static let imageHeight: CGFloat = 44
            static let leadingPadding: CGFloat = 16
            static let trailingPadding: CGFloat = 16
            static let textOpacity: CGFloat = 0.8
            static let cellHeight: CGFloat = 85
            static let ratingSize: CGFloat = 12
            static let priceChangeIconPadding: CGFloat = 8
            static let priceAndPriceChangePadding: CGFloat = 8
            static let cellCornerRadius: CGFloat = 16
            static let triangleIconSize: CGFloat = 10
        }
        enum Colors {
            static let bgColor = Asset.Colors.backgroundColor.swiftUIColor
            static let fontColor = Asset.Colors.fontColor.swiftUIColor
            static let rowColor = Asset.Colors.rowColor.swiftUIColor
        }
    }
    
    let asset: AssetModel
    
    var body: some View {
        HStack(spacing: Constants.Layout.horizontalSpacing) {
            ZStack {
                Circle()
                    .fill(Constants.Colors.bgColor)
                    .frame(
                        width: Constants.Layout.imageWidth,
                        height: Constants.Layout.imageHeight
                    )
                Image(systemName: asset.image)
                    .fontWeight(.bold)
            }
            .padding(.leading, Constants.Layout.leadingPadding)
            
            VStack(alignment: .leading, spacing: Constants.Layout.verticalSpacing) {
                VStack(alignment: .leading) {
                    Text(asset.fullName)
                        .font(.headline)
                    Text(asset.shortName)
                        .font(.footnote)
                        .opacity(Constants.Layout.textOpacity)
                }
                Text(asset.ratingFormated)
                    .font(.system(size: Constants.Layout.ratingSize))
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: Constants.Layout.priceAndPriceChangePadding) {
                Text(asset.priceFormated)
                    .font(.headline)
                HStack(spacing: Constants.Layout.priceChangeIconPadding) {
                    asset.priceChangeIcon
                        .foregroundColor(asset.priceChangeColor)
                        .font(.system(size: Constants.Layout.triangleIconSize))
                    Text(asset.priceChangeFormated)
                        .font(.footnote)
                        .opacity(Constants.Layout.textOpacity)
                }
            }
            .padding(.trailing, Constants.Layout.trailingPadding)
        }
        .foregroundColor(Constants.Colors.fontColor)
        .frame(height: Constants.Layout.cellHeight)
        .background(Constants.Colors.rowColor)
        .clipShape(RoundedRectangle(cornerRadius: Constants.Layout.cellCornerRadius))
    }
}
