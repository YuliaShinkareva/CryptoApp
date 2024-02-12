//
//  PortfolioRow.swift
//  CryptoApp
//
//  Created by yulias on 03/01/2024.
//

import SwiftUI

struct PortfolioRow: View {
    
    private enum Constants {
        
        enum Colors {
            static let fontGray = Asset.Colors.fontGrayColor.swiftUIColor
            static let row = Asset.Colors.rowColor.swiftUIColor
            static let font = Asset.Colors.fontColor.swiftUIColor
        }
        
        enum Layout {
            static let spacingHStackBody: CGFloat = 30
            static let frameHeightHStackBody: CGFloat = 85
            static let cornerRadiusHStackBody: CGFloat = 16
            static let cryptoImageHeight: CGFloat = 44
            static let cryptoImageWidth: CGFloat = 44
            static let cryptoImagePadding: CGFloat = 16
            static let cryptoInfoSpacing: CGFloat = 8
            static let quotationInfoSpacing: CGFloat = 8
            static let triangleIconHStackSpacing: CGFloat = 8
            static let triangleIconFrameWidth: CGFloat = 12
            static let triangleIconFrameHeight: CGFloat = 12
            static let quotationPadding: CGFloat = 20
        }
    }
    
    @ObservedObject var viewModel: PortfolioViewModel
    let portfolio: PortfolioModel

    var body: some View {
        HStack(spacing: Constants.Layout.spacingHStackBody) {
            cryptoImage
            cryptoInfo
            Spacer()
            quotationInfo
        }
        .foregroundColor(Constants.Colors.font)
        .frame(height: Constants.Layout.frameHeightHStackBody)
        .background(Constants.Colors.row)
        .cornerRadius(Constants.Layout.cornerRadiusHStackBody)
    }
    
    private var cryptoImage: some View {
        portfolio.cryptoImage
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: Constants.Layout.cryptoImageWidth, height: Constants.Layout.cryptoImageHeight)
            .background(Color.white)
            .clipShape(Circle())
            .padding(.leading, Constants.Layout.cryptoImagePadding)
    }
    
    private var cryptoInfo: some View {
        VStack(alignment: .leading, spacing: Constants.Layout.cryptoInfoSpacing) {
            Text(portfolio.cryptoName)
                .font(.headline)
            Text(portfolio.shortCryptoName)
                .font(.footnote)
                .foregroundColor(Constants.Colors.fontGray)
        }
        .bold()
    }
    
    private var quotationInfo: some View {
        VStack(alignment: .trailing, spacing: Constants.Layout.quotationInfoSpacing) {
            Text(viewModel.formattedQuotation(for: portfolio))
                .font(.headline)
            HStack(spacing: Constants.Layout.triangleIconHStackSpacing) {
                Image(systemName: viewModel.dynamicsImage(for: portfolio))
                    .resizable()
                    .scaledToFit()
                    .frame(width: Constants.Layout.triangleIconFrameWidth, height: Constants.Layout.triangleIconFrameHeight)
                    .foregroundColor(viewModel.dynamicsColor(for: portfolio))
                Text(viewModel.dynamicsString(for: portfolio))
                    .font(.footnote)
            }
        }
        .padding(.trailing, Constants.Layout.quotationPadding)
    }
}

struct PortfolioRow_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = PortfolioViewModel()
        PortfolioRow(viewModel: viewModel, portfolio: PortfolioMockAssets().portfolioAssets[1])
    }
}
