//
//  ArticleInfo.swift
//  CryptoApp
//
//  Created by yulias on 16.01.24.
//

import SwiftUI

struct InfoModel: Identifiable {
    let id = UUID()
    let icon: String
    let text: String
}

struct ArticleInfo: View {
    
    private enum Constants {
        enum Images {
            static let readingTime: String = LocalizedString.clockIcon
            static let postTime: String = LocalizedString.calendarIcon
            static let comments: String = LocalizedString.messagesIcon 
        }
        enum Layout {
            static let mainHStackSpacing: CGFloat = 12
            static let iconSize: CGFloat = 14
            static let fontOpacity: CGFloat = 0.8
        }
    }
    
    let newsModel: NewsModel
    private let infoAssets: [InfoModel]
    
    init(newsModel: NewsModel) {
        self.newsModel = newsModel
        
        infoAssets = [
            InfoModel(icon: Constants.Images.readingTime,
                      text: newsModel.minOfReading),
            InfoModel(icon: Constants.Images.postTime,
                      text: newsModel.date),
            InfoModel(icon: Constants.Images.comments,
                      text: newsModel.numberOfComments)
        ]
    }
    
    var body: some View {
        HStack(spacing: Constants.Layout.mainHStackSpacing) {
            ForEach(infoAssets) { infoElement in
                HStack {
                    Image(systemName: infoElement.icon)
                        .font(.system(size: Constants.Layout.iconSize))
                    
                    Text(infoElement.text)
                        .font(.footnote)
                        .opacity(Constants.Layout.fontOpacity)
                }
            }
        }
    }
}
