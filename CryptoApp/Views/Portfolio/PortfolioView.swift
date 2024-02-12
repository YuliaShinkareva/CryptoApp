//
//  PortfolioView.swift
//  CryptoApp
//
//  Created by yulias on 27/12/2023.
//

import SwiftUI

struct PortfolioView: View {

    private enum Constants {
        
        enum Colors {
            static let background = Asset.Colors.backgroundColor.swiftUIColor
            static let lightBlue = Asset.Colors.lightBlue.swiftUIColor
            static let font = Asset.Colors.fontColor.swiftUIColor
            static let row = Asset.Colors.rowColor.swiftUIColor
        }
        
        enum Layout {
            static let fontSize: CGFloat = 30
            static let paddingTabBar: CGFloat = 15
            static let totalBalanceViewCornerRadous: CGFloat = 15
            static let chartCornerRadius: CGFloat = 10
            static let chartMinHeight: CGFloat = 180
            static let chartMaxHeight: CGFloat = 200
            static let suitcaseWidth: CGFloat = 24
            static let suitcaseHeight: CGFloat = 24
            static let assetsListViewVerticalPadding: CGFloat = 8
            static let horizontalPadingAssetsList: CGFloat = 5
            static let verticalPaddingAssetsList: CGFloat = 2
            static let portfolioIconWIdth: CGFloat = 90
            static let portfolioIconHeight: CGFloat = 90
            static let portfolioIconTopPadding: CGFloat = 20
        }
        
        enum Text {
            static let portfolioTitle = LocalizedString.portfolioTitle
            static let totalBalance = LocalizedString.totalBalanceTitle
            static let triangleFillImage = LocalizedString.triangleFillTitle
            static let mockDynamicsTotal = LocalizedString.mockTotalDynamics
            static let suitcaseFillImage = LocalizedString.suitcaseFillTitle
            static let cryptoAssetsTitle = LocalizedString.cryptoAssetsTitle
        }
    }

    @StateObject var viewModel: PortfolioViewModel

    var body: some View {
          VStack(alignment: .leading) {
              totalBalanceView
              chartView
              cryptoAssetsTitle
              assetsListView
          }
          .padding(.vertical, Constants.Layout.paddingTabBar)
          .background(Constants.Colors.background)
          .onAppear {
              viewModel.calculateTotalBalance()
          }
      }
      
      private var totalBalanceView: some View {
          HStack {
              VStack(alignment: .leading) {
                  Text(Constants.Text.totalBalance)
                      .font(.title2)
                      .foregroundColor(.gray)
                  Text(viewModel.totalBalance.formattedCurrencyString(currencyType: .usd))
                      .font(.largeTitle)
                      .bold()
                      .foregroundColor(.white)
                  HStack {
                      Image(systemName: Constants.Text.triangleFillImage)
                      Text(Constants.Text.mockDynamicsTotal)
                  }
                  .bold()
                  .background(Constants.Colors.row)
                  .cornerRadius(Constants.Layout.totalBalanceViewCornerRadous)
                  .foregroundColor(Constants.Colors.lightBlue)
              }
              Spacer()
              portfolioIcon
          }
          .padding(.horizontal)
      }
      
    // to be replaced with a dynamic chart in the future when backend is available
      private var chartView: some View {
          HStack(spacing: .zero) {
              Asset.Assets.graphLeft.swiftUIImage
                  .resizable()
                  .scaledToFit()
                  .cornerRadius(Constants.Layout.chartCornerRadius)
                  .frame(maxWidth: .infinity, minHeight: Constants.Layout.chartMinHeight, maxHeight: Constants.Layout.chartMaxHeight)

              Asset.Assets.graphRight.swiftUIImage
                  .resizable()
                  .scaledToFit()
                  .cornerRadius(Constants.Layout.chartCornerRadius)
                  .frame(maxWidth: .infinity, minHeight: Constants.Layout.chartMinHeight, maxHeight: Constants.Layout.chartMaxHeight)
          }
          .padding()
      }

      private var cryptoAssetsTitle: some View {
          HStack {
              Image(systemName: Constants.Text.suitcaseFillImage)
                  .resizable()
                  .scaledToFit()
                  .frame(width: Constants.Layout.suitcaseWidth, height: Constants.Layout.suitcaseHeight)
              
              Text(Constants.Text.cryptoAssetsTitle)
                  .font(.headline)
                  .bold()
          }
          .foregroundColor(Constants.Colors.font)
          .padding(.leading)
      }

      private var assetsListView: some View {
          ScrollView(.vertical) {
              ForEach(viewModel.portfolioAssets) { asset in
                  PortfolioRow(viewModel: viewModel, portfolio: asset)
                      .padding(.vertical, Constants.Layout.assetsListViewVerticalPadding)
              }
          }
          .scrollIndicators(.visible)
          .padding(.horizontal, Constants.Layout.horizontalPadingAssetsList)
          .padding(.vertical, Constants.Layout.verticalPaddingAssetsList)
      }
      
      private var portfolioIcon: some View {
          Asset.Assets.portfolioTabIcon.swiftUIImage
              .resizable()
              .scaledToFill()
              .frame(width: Constants.Layout.portfolioIconWIdth, height: Constants.Layout.portfolioIconHeight)
              .padding(.top, Constants.Layout.portfolioIconTopPadding)
              .foregroundColor(Asset.Colors.purple.swiftUIColor)
      }
}

struct Portfolio_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView(viewModel: PortfolioViewModel())
    }
}
