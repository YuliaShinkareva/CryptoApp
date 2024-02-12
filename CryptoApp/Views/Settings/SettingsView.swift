//
//  Settings.swift
//  CryptoApp
//
//  Created by yulias on 27/12/2023.
//

import SwiftUI

struct SettingsView: View {
    
    private enum Constants {
        
        enum Colors {
            static let background = Asset.Colors.backgroundColor.swiftUIColor
            static let font = Asset.Colors.fontColor.swiftUIColor
            static let purple = Asset.Colors.purple.swiftUIColor
            static let fontGray = Asset.Colors.fontColor.swiftUIColor
            static let settingsToggle = Asset.Colors.settingsColor.swiftUIColor
            static let row = Asset.Colors.rowColor.swiftUIColor.opacity(0.7)
        }
        
        enum Layout {
            static let userInfoViewTopPadding: CGFloat = 5
            static let bodyVStackPadding: CGFloat = 15
            static let imageFrameHeight: CGFloat = 5
            static let buttonText: CGFloat = 16
            static let userInfoSpacing: CGFloat = 15
            static let userPicFrameHeight: CGFloat = 80
            static let userPicFrameWidth: CGFloat = 80
            static let userEmailFont: CGFloat = 18
            static let whiteOpacity: CGFloat = 0.8
        }
        
        enum Text {
            static let chevronUp = LocalizedString.chevronUp
            static let chevronDown = LocalizedString.chevronDown
            static let chevronRight = LocalizedString.chevronRightIcon
            static let showLess = LocalizedString.showLess
            static let showMore = LocalizedString.showMore
            static let userName = LocalizedString.userName
            static let userEmail = LocalizedString.userEmail
            static let totalBalance = LocalizedString.totalBalance
            static let creditCardFill = LocalizedString.creditcardFill
            static let mockUSDAmount = LocalizedString.xxxUSD
            static let portfolioDiversity = LocalizedString.portfolioDiversity
            static let chartPieFill = LocalizedString.chartPieFill
            static let portfolioDiversityFigures = LocalizedString.portfolioDiversityFigures
        }
    }
    
    @ObservedObject var viewModel: SettingsViewModel
 
    var body: some View {
        VStack {
            userInfoView
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, Constants.Layout.userInfoViewTopPadding)
            if viewModel.showMore {
               SettingsScrollableView(viewModel: viewModel)
            }
            buttonView
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
            Spacer()
        }
        .padding(.vertical, Constants.Layout.bodyVStackPadding)
        .background(Constants.Colors.background)
    }
    
    private var buttonView: some View {
        Button(action: {
            viewModel.toggleShowMore()
        }) {
            HStack {
                Image(systemName: viewModel.showMore ?
                      Constants.Text.chevronUp : Constants.Text.chevronDown)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: Constants.Layout.imageFrameHeight)
                    .bold()
                Text(viewModel.showMore ? Constants.Text.showLess : Constants.Text.showMore)
                    .font(.system(size: Constants.Layout.buttonText))
                    .bold()
            }
            .foregroundColor(Constants.Colors.font)
            .padding()
            .frame(maxWidth: .infinity)
            .gradientBackgroundStyle()
        }
    }
    
    private var userInfoView: some View {
        VStack(alignment: .leading, spacing: Constants.Layout.userInfoSpacing) {
            HStack(spacing: Constants.Layout.userInfoSpacing) {
                Asset.Assets.userpicIcon.swiftUIImage
                    .resizable()
                    .frame(width: Constants.Layout.userPicFrameWidth, height: Constants.Layout.userPicFrameHeight)
                    .padding(.top)
                VStack(alignment: .trailing) {
                    Text(Constants.Text.userName)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text(Constants.Text.userEmail)
                        .font(.system(size: Constants.Layout.userEmailFont))
                        .foregroundColor(.blue)
                }
            }
            
            Divider()
            
            HStack {
                Label(Constants.Text.totalBalance, systemImage: Constants.Text.creditCardFill)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(Constants.Layout.whiteOpacity))
                
                Spacer()
                
                Text(Constants.Text.mockUSDAmount)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            
            HStack {
                Label(Constants.Text.portfolioDiversity, systemImage: Constants.Text.chartPieFill)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(Constants.Layout.whiteOpacity))
                
                Spacer()
                
                Text(Constants.Text.portfolioDiversityFigures)
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
        }
        .padding([.leading, .bottom, .trailing])
        .gradientBackgroundStyle()
        .padding(.horizontal)
    }
}


extension View {
    func gradientBackgroundStyle() -> some View {
        self.modifier(GradientBackgroundStyle())
    }
}


struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: SettingsViewModel())
    }
}
