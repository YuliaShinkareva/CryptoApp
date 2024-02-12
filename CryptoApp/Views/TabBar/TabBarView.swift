//
//  ContentView.swift
//  CryptoApp_tab
//
//  Created by yulias on 26/12/2023.
//


import SwiftUI

struct TabBarView: View {
    
    private enum Constants {
        
        enum Text {
            static let portfolioTitle = LocalizedString.portfolioTitle
            static let allAssetsTitle = LocalizedString.allAssetsTitle
            static let newsTitle = LocalizedString.newsTitle
            static let settingsTitle = LocalizedString.settingsTitle
        }
        
        enum Colors {
            static let background = Asset.Colors.backgroundColor.swiftUIColor
            static let tabBar = Asset.Colors.lightBlue.swiftUIColor
            static let fontGray = Asset.Colors.fontGrayColor.swiftUIColor
        }
        
        enum Layout {
            static let paddingHSTack: CGFloat = 6
            static let backgroundTabBarOpacity: CGFloat = 0.5
            static let cornerRadiusZStack: CGFloat = 35
            static let horizontalPaddingZStack: CGFloat = 26
            static let tabBarFrame: CGFloat = 70
            static let tabViewImageWidth: CGFloat = 25
            static let tabViewImageHeight: CGFloat = 25
            static let textFontSize: CGFloat = 14
            static let customTabItemHStackSpacing: CGFloat = 10
            static let customTabItemCornerRadius: CGFloat = 30
            static let customTabItemFrameInfinity: CGFloat = 60
            static let customTabItemFrameHeight: CGFloat = 60
            static let paddingForEachTabbedItems: CGFloat = 20
        }
    }
    
    @State private var selectedTab: Int = TabbedItems.portfolio.rawValue
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
               PortfolioView(viewModel: PortfolioViewModel())
                    .tag(TabbedItems.portfolio.rawValue)
               AllAssetsView(viewModel: AllAssetsViewModel())
                    .tag(TabbedItems.allAssets.rawValue)
               NewsView(viewModel: NewsViewModel())
                    .tag(TabbedItems.news.rawValue)
               SettingsView(viewModel: SettingsViewModel())
                    .tag(TabbedItems.settings.rawValue)
            }
            ZStack {
                HStack {
                    ForEach((TabbedItems.allCases), id: \.self) { item in
                        Button {
                            selectedTab = item.rawValue
                        } label: {
                            customTabItem(tabItem: item, isActive: (selectedTab == item.rawValue))
                        }
                    }
                }
                .padding(Constants.Layout.paddingHSTack)
            }
            .frame(height: Constants.Layout.tabBarFrame)
            .background(Constants.Colors.tabBar.opacity(Constants.Layout.backgroundTabBarOpacity))
            .cornerRadius(Constants.Layout.cornerRadiusZStack)
            .padding(.horizontal, Constants.Layout.horizontalPaddingZStack)
            .padding(.bottom, Constants.Layout.paddingForEachTabbedItems)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

extension TabBarView {
    func customTabItem(tabItem: TabbedItems, isActive: Bool) -> some View {
        HStack(spacing: Constants.Layout.customTabItemHStackSpacing) {
            Spacer()
            tabItem.iconImage
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Constants.Colors.background)
                .frame(width: Constants.Layout.tabViewImageWidth, height: Constants.Layout.tabViewImageHeight)
            if isActive {
                Text(tabItem.title)
                    .font(.system(size: Constants.Layout.textFontSize, weight: .bold))
                    .foregroundColor(isActive ? Constants.Colors.background : Constants.Colors.fontGray)
            }
            Spacer()
        }
        .frame(width: isActive ? nil: Constants.Layout.customTabItemFrameInfinity, height: Constants.Layout.customTabItemFrameHeight)
        .background(isActive ? Constants.Colors.tabBar : .clear)
        .cornerRadius(Constants.Layout.customTabItemCornerRadius)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
