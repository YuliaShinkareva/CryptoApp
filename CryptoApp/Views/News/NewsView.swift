//
//  NewsView.swift
//  CryptoApp
//
//  Created by yulias on 27/12/2023.
//

import SwiftUI

struct NewsView: View {
    
    private enum Constants {
        enum Colors {
            static let bgColor = Asset.Colors.backgroundColor.swiftUIColor
            static let fontColor = Asset.Colors.fontColor.swiftUIColor.opacity(0.5)
        }
        enum Layout {
            static let dividerOpacity: CGFloat = 0.5
            static let cellSpacing: CGFloat = 12
            static let cellPadding: CGFloat = 6
            static let mainVStackPadding: CGFloat = 16
        }
    }
    
    @StateObject var viewModel: NewsViewModel
    
    var body: some View {
        NavigationStack(path: $viewModel.newsNavigationStack) {
            ZStack {
                Constants.Colors.bgColor
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: Constants.Layout.cellSpacing) {
                    SearchField(userInput: $viewModel.userInput) {
                        viewModel.searchCryptoNews()
                    }
                    
                    Divider()
                        .background(Constants.Colors.fontColor)
                    
                    ScrollView {
                        ForEach(viewModel.news) { newsModel in
                            NewsRow(newsModel: newsModel)
                                .padding(.vertical, Constants.Layout.cellPadding)
                                .onTapGesture {
                                    viewModel.newsNavigationStack.append(newsModel)
                                }
                        }
                    }
                    .scrollIndicators(.never)
                }
                .padding(Constants.Layout.mainVStackPadding)
                .toolbar(.hidden)
                .navigationDestination(for: NewsModel.self) { news in
                    NewsDetailView(viewModel: NewsDetailViewModel(path: $viewModel.newsNavigationStack), newsModel: news)
                }
            }
        }
    }
}

struct News_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(viewModel: NewsViewModel())
    }
}
