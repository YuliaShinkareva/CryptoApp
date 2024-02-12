//
//  NewsRow.swift
//  CryptoApp
//
//  Created by yulias on 11.01.24.
//

import SwiftUI

struct NewsRow: View {
    
    private enum Constants {
        enum Colors {
            static let rowColor = Asset.Colors.rowColor.swiftUIColor
            static let fontColor = Asset.Colors.fontColor.swiftUIColor
        }
        enum Layout {
            static let mainHStackSpacing: CGFloat = 12
            static let imageWidth: CGFloat = 76
            static let imageHeight: CGFloat = 76
            static let imageCornerRadius: CGFloat = 12
            static let imagePadding: CGFloat = 6
            static let hashtagFontSize: CGFloat = 10
            static let titleFontSize: CGFloat = 14
            static let contentFontSize: CGFloat = 11
            static let footerFontSize: CGFloat = 12
            static let titleContentSpacing: CGFloat = 4
            static let titleLineLimit: Int = 2
            static let contentLineLimit: Int = 3
            static let cellCornerRadius: CGFloat = 16
            static let cellHeight: CGFloat = 140
        }
        enum Text {
            static let messagesIcon = LocalizedString.messagesIcon
            static let chevronRight = LocalizedString.chevronRightIcon
        }
    }
    
    let newsModel: NewsModel
    
    var body: some View {
    HStack(alignment: .top, spacing: Constants.Layout.mainHStackSpacing) {
            
        VStack(alignment: .leading) {
            Image(newsModel.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(
                    width: Constants.Layout.imageWidth,
                    height: Constants.Layout.imageHeight
                )
                .cornerRadius(Constants.Layout.imageCornerRadius)
                .padding(.trailing, Constants.Layout.imagePadding)
            
            Spacer()
                
            Text(newsModel.hashtagsString)
                .font(.system(size: Constants.Layout.hashtagFontSize))
                .fontWeight(.regular)
            }
            
            VStack {
                VStack(alignment: .leading, spacing: Constants.Layout.titleContentSpacing) {
                    Text(newsModel.title)
                        .lineLimit(Constants.Layout.titleLineLimit)
                        .font(.system(size: Constants.Layout.titleFontSize))
                        .fontWeight(.semibold)
                    
                    Text(newsModel.content)
                        .lineLimit(Constants.Layout.contentLineLimit)
                        .font(.system(size: Constants.Layout.contentFontSize))
                        .fontWeight(.light)
                }
                .multilineTextAlignment(.leading)
                
                Spacer()
                
                HStack {
                    Text(newsModel.date)
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: Constants.Text.messagesIcon)
                        Text(newsModel.numberOfComments)
                        
                    }
                }
                .fontWeight(.light)
                .font(.system(size: Constants.Layout.footerFontSize))
            }
            
            VStack {
                Spacer()
                
                Image(systemName: Constants.Text.chevronRight)
                
                Spacer()
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: Constants.Layout.cellHeight)
        .background(Constants.Colors.rowColor)
        .foregroundColor(Constants.Colors.fontColor)
        .clipShape(RoundedRectangle(cornerRadius: Constants.Layout.cellCornerRadius))
        }
    }

struct NewsRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsRow(newsModel: MockNewsData().data[1])
    }
}
