//
//  DropDownMenu.swift
//  CryptoApp
//
//  Created by yulias on 4.01.24.
//

import SwiftUI

struct DropDownMenu: View {
    
    @ObservedObject var viewModel: AllAssetsViewModel
    
    var body: some View {
        VStack(spacing: .zero) {
            ForEach(viewModel.sortCases) { sortCase in
                DropdownMenuRow(
                    viewModel: viewModel,
                    sortModel: sortCase
                )
            }
        }
    }
    
}
