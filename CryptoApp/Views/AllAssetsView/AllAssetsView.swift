//
//  AllAssetsView.swift
//  CryptoApp
//
//  Created by yulias on 29.12.23.
//

import SwiftUI

struct AllAssetsView: View {
    
    private enum Constants {
        enum Layout {
            static let mainStackSpacing: CGFloat = 20
            static let sortByMaxHeight: CGFloat = 30
            static let assetRowVerticalPadding: CGFloat = 6
            static let mainStackTopPadding: CGFloat = 16
            static let mainStackHorizontalPadding: CGFloat = 16
            static let dropDownWidth: CGFloat = 200
            static let dropDownCornerRadius: CGFloat = 20
        }
        enum Colors {
            static let dividerColor = Asset.Colors.fontColor.swiftUIColor.opacity(0.5)
            static let backgroundColor = Asset.Colors.backgroundColor.swiftUIColor
        }
    }
    
    @StateObject var viewModel = AllAssetsViewModel()
    
    var body: some View {
        ZStack {
            Constants.Colors.backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: Constants.Layout.mainStackSpacing) {
                
                VStack {
                    SearchField(userInput: $viewModel.userInput,
                                action: viewModel.checkUserInput)
                    .allowsHitTesting(!viewModel.sortMenuShowing)
                }
                    
                VStack(alignment: .trailing) {
                    VStack {
                        SortView(isSortTaped: $viewModel.sortMenuShowing)
                        .overlay(GeometryReader { geometry in
                            Color.clear.preference(key: SortPreferenceKey.self, value: geometry.frame(in: .global))
                        })
                    }
                    Divider()
                        .background(Constants.Colors.dividerColor)
                }
                .frame(maxHeight: Constants.Layout.sortByMaxHeight)
                .onPreferenceChange(SortPreferenceKey.self) { sortFrame in
                    viewModel.sortFramePosition = sortFrame
                }
                     
                VStack {
                    ScrollView {
                        ForEach(viewModel.arrayOfAssets) { asset in
                            AssetsRow(asset: asset)
                                .padding(.vertical, Constants.Layout.assetRowVerticalPadding)
                        }
                    }
                    .scrollDisabled(viewModel.sortMenuShowing)
                    .scrollIndicators(.hidden)
                }
            }
            .padding(.vertical, Constants.Layout.mainStackTopPadding)
            .padding(.horizontal, Constants.Layout.mainStackHorizontalPadding)
            .blur(radius: viewModel.blurRadius)
            .onTapGesture {
                withAnimation(.easeIn) {
                    viewModel.dismissSortMenu()
                }
            }
            
            DropDownMenu(viewModel: viewModel)
                .opacity(viewModel.dropdownMenuOpacity)
                .frame(width: Constants.Layout.dropDownWidth)
                .cornerRadius(Constants.Layout.dropDownCornerRadius)
                .position(x: viewModel.dropdownXPosition,
                          y: viewModel.dropdownYPosition)
                .offset(x: viewModel.dropdownXOffset,
                        y: viewModel.dropdownYOffset)
        }
        .toolbar(.hidden)
        .onDisappear {
            viewModel.dismissSortMenu()
        }
    }
}

struct SortPreferenceKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
    typealias Value = CGRect
}

struct AllAssetsView_Previews: PreviewProvider {
    static var previews: some View {
        AllAssetsView(viewModel: AllAssetsViewModel())
    }
}
