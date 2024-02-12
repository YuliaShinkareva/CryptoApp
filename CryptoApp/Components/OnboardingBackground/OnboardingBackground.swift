//
//  OnboardingBackground.swift
//  CryptoApp
//
//  Created by yulias on 26.12.23.
//

import SwiftUI

struct OnboardingBackground: View {
    
    private enum Constants {
        enum Layout {
            static let startRadius: CGFloat = 0
            static let endRadius: CGFloat = 900
        }
        enum Colors {
            static let lightBlue = Asset.Colors.lightBlue.swiftUIColor
            static let darkBlue = Asset.Colors.darkBlue.swiftUIColor
            static let purple = Asset.Colors.purple.swiftUIColor
        }
    }
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [
                Constants.Colors.darkBlue,
                Constants.Colors.purple,
                Constants.Colors.lightBlue
            ],
            center: .bottomTrailing,
            startRadius: Constants.Layout.startRadius,
            endRadius: Constants.Layout.endRadius)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .ignoresSafeArea()
    }
}
