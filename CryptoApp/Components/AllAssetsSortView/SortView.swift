//
//  SortView.swift
//  CryptoApp
//
//  Created by yulias on 5.01.24.
//

import SwiftUI

struct SortView: View {
    
    private enum Constants {
        enum Text {
            static let sortIcon: String = LocalizedString.chevronDown
            static let sortBy: String = LocalizedString.sortBy
        }
        enum Layout {
            static let fontOpacity: CGFloat = 0.75
            static let horizontalSpacing: CGFloat = 6
            static let iconSize: CGFloat = 20
            static let topPadding: CGFloat = 8
            static let horizontalPadding: CGFloat = 16
        }
    }
    
    @Binding var isSortTaped: Bool
    
    var body: some View {
        HStack(spacing: Constants.Layout.horizontalSpacing) {
            Text(Constants.Text.sortBy)
                .font(.title2)
                .fontWeight(.semibold)
            Image(systemName: Constants.Text.sortIcon)
                .font(.system(size: Constants.Layout.iconSize))
                .fontWeight(.semibold)
        }
        .padding(.top, Constants.Layout.topPadding)
        .padding(.horizontal, Constants.Layout.horizontalPadding)
        .foregroundColor(Asset.Colors.fontColor.swiftUIColor.opacity(Constants.Layout.fontOpacity))
        .onTapGesture {
            withAnimation(.easeInOut) {
                isSortTaped.toggle()
            }
        }
    }
}
