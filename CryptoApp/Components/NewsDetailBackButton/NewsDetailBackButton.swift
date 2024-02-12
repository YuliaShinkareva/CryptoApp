//
//  NewsDetailBackButton.swift
//  CryptoApp
//
//  Created by yulias on 16.01.24.
//

import SwiftUI

struct NewsDetailBackButton: View {
    private enum Constants {
        enum Colors {
            static let bgColor = Asset.Colors.backgroundColor.swiftUIColor.opacity(0.8)
        }
        enum Images {
            static let backBtn = LocalizedString.xmarkCircle
        }
        enum Layout {
            static let imageWidth: CGFloat = 50
            static let imageHeight: CGFloat = 50
            static let backBtnSize: CGFloat = 36
            static let topPadding: CGFloat = 46
            static let horizontalPadding: CGFloat = 20
        }
    }
    
    let action: () -> ()
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Circle()
                    .fill(Constants.Colors.bgColor)
                    .frame(
                        width: Constants.Layout.imageWidth,
                        height: Constants.Layout.imageHeight
                    )
                    .overlay {
                        Image(systemName: Constants.Images.backBtn)
                            .foregroundColor(.white)
                            .font(.system(size: Constants.Layout.backBtnSize))
                    }
                    .padding(.top, Constants.Layout.topPadding)
                    .padding(.horizontal, Constants.Layout.horizontalPadding)
                    .onTapGesture {
                        action()
                    }
            }
            Spacer()
        }
        .ignoresSafeArea()
    }
}
