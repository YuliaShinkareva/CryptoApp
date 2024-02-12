//
//  DropdownMenuRow.swift
//  CryptoApp
//
//  Created by yulias on 9.01.24.
//

import SwiftUI

struct DropdownMenuRow: View {
    
    private enum Constants {
        enum Colors {
            static let bgColor = Asset.Colors.backgroundColor.swiftUIColor.opacity(0.9)
            static let fontColor = Asset.Colors.fontColor.swiftUIColor
        }
    }
    
    @ObservedObject var viewModel: AllAssetsViewModel
    @State var sortModel: SortModel
    
    var body: some View {
        VStack(spacing: .zero) {
            HStack {
                Text(sortModel.sortType.title)
                    .font(.title2)
                    .fontWeight(sortModel.fontWeight)
                    .foregroundColor(sortModel.fontColor)
                
                sortModel.arrowImage
                    .foregroundColor(sortModel.arrowColor)
                
            }
           .padding()

            Divider()
                .background(Constants.Colors.fontColor.opacity(sortModel.deviderOpacity))
            
        }
        .frame(maxWidth: .infinity)
        .background(Constants.Colors.bgColor)
        .onTapGesture {
            sortModel.isAscending.toggle()
            withAnimation {
                viewModel.dismissSortMenu()
                viewModel.sortAssets(by: sortModel.sortType, isAscending: sortModel.isAscending)
            }
        }
    }
}

struct DropdownMenuRow_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenuRow(viewModel: AllAssetsViewModel(), sortModel: SortModel(sortType: .name))
    }
}
