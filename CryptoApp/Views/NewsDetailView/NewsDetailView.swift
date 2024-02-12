//
//  NewsDetailView.swift
//  CryptoApp
//
//  Created by yulias on 11.01.24.
//

import SwiftUI

struct NewsDetailView: View {
    
    private enum Constants {
        enum Layout {
            static let mainVStackSpacing: CGFloat = 12
            static let textVStackSpacing: CGFloat = 24
            static let horizontalPadding: CGFloat = 30
            static let hashtagOpacity: CGFloat = 0.8
            static let textPadding: CGFloat = 12
            static let scrollviewBottomPadding: CGFloat = 16
            static let minimumSwipeDistance: CGFloat = 30
        }
        enum Colors {
            static let bgColor = Asset.Colors.backgroundColor.swiftUIColor
            static let fontColor = Asset.Colors.fontColor.swiftUIColor
        }
    }
    
    @StateObject var viewModel: NewsDetailViewModel
    let newsModel: NewsModel
    
    var body: some View {
        ZStack {
            Constants.Colors.bgColor.ignoresSafeArea()
            
            ScrollView {
                Image(newsModel.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        width: viewModel.imageWidth,
                        height: viewModel.imageHeight
                    )
                    .clipped()

                VStack(alignment: .leading, spacing: Constants.Layout.textVStackSpacing) {
                    Text(newsModel.title)
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Text(newsModel.hashtagsString)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .opacity(Constants.Layout.hashtagOpacity)
                    
                    ArticleInfo(newsModel: newsModel)
                    
                    Text(newsModel.content)
                        .font(.body)
                        .fontWeight(.light)
                }
                .padding(Constants.Layout.textPadding)
                .foregroundColor(Constants.Colors.fontColor)
            }
            .toolbar(.hidden)
            .ignoresSafeArea()
            .padding(.bottom, Constants.Layout.scrollviewBottomPadding)
            .overlay {
                GeometryReader { proxy in
                    Color.clear.preference(key: ScreenSizePreferenceKey.self, value: proxy.size)
                }
            }
            .onPreferenceChange(ScreenSizePreferenceKey.self) { screen in
                viewModel.updateScreenSize(with: screen)
            }
            .gesture(
                DragGesture (
                    minimumDistance: Constants.Layout.minimumSwipeDistance,
                    coordinateSpace: .local
                )
                .onEnded { value in
                    viewModel.deleteOnSwipe(value.translation.width)
                }
            )
            
            NewsDetailBackButton {
                viewModel.path.removeLast()
            }
        }
    }
}

struct ScreenSizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
    typealias Value = CGSize
}
