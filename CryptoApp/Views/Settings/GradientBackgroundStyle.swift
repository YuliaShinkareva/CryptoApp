//
//  GradientBackgroundStyle.swift
//  CryptoApp
//
//  Created by yulias on 16/01/2024.
//

import SwiftUI

struct GradientBackgroundStyle: ViewModifier {
    
    private enum Constants {
        
        enum Colors {
            static let purple = Asset.Colors.purple.swiftUIColor.opacity(0.15)
            static let fontGray = Asset.Colors.fontColor.swiftUIColor.opacity(0.1)
        }
        
        enum Layout {
            static let contentCornerRadius: CGFloat = 20
            static let grayOpacity: CGFloat = 0.4
            static let shadowRadius: CGFloat = 5
            static let shadowY: CGFloat = 2
        }
    }
    
    func body(content: Content) -> some View {
        content
            .background(LinearGradient(gradient: Gradient(colors: [
                Constants.Colors.purple, Constants.Colors.fontGray
            ]), startPoint: .top, endPoint: .bottom))
            .cornerRadius(Constants.Layout.contentCornerRadius)
            .shadow(color: .gray.opacity(Constants.Layout.grayOpacity),
                    radius: Constants.Layout.shadowRadius,
                    x: .zero, y: Constants.Layout.shadowY)
    }
}

