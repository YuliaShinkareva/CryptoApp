//
//  SearchField.swift
//  CryptoApp
//
//  Created by yulias on 5.01.24.
//

import SwiftUI

struct SearchField: View {
    
    private enum Constants {
        enum Text {
            static let leftIcon = LocalizedString.magnifyingGlassIcon
            static let rightIcon = LocalizedString.xmarkCircle
        }
        enum Layout {
            static let iconOpacity: CGFloat = 0.3
            static let iconSize: CGFloat = 20
            static let leadingPadding: CGFloat = 16
            static let trailingPadding: CGFloat = 16
            static let textFieldPadding: CGFloat = 15
            static let textFieldHeight: CGFloat = 45
            static let textFieldTextOpacity: CGFloat = 0.8
            static let cornerRadius: CGFloat = 16
            static let borderOpacity: CGFloat = 0.3
        }
        enum Color {
            static let fontColor = Asset.Colors.fontColor.swiftUIColor
            static let bgColor = Asset.Colors.rowColor.swiftUIColor.opacity(0.1)
        }
    }
    
    @Binding var userInput: String
    let action: () -> ()
    
    var body: some View {
        HStack {
            Image(systemName: Constants.Text.leftIcon)
                .font(.system(size: Constants.Layout.iconSize))
                .opacity(Constants.Layout.iconOpacity)
                .padding(.leading, Constants.Layout.leadingPadding)
            
            TextField("", text: $userInput)
                .padding(Constants.Layout.textFieldPadding)
                .frame(height: Constants.Layout.textFieldHeight)
                .opacity(Constants.Layout.textFieldTextOpacity)
                .tint(Constants.Color.fontColor)
                .onChange(of: userInput) { _ in
                    action()
                }
                
            Image(systemName: Constants.Text.rightIcon)
                .font(.system(size: Constants.Layout.iconSize))
                .opacity(Constants.Layout.iconOpacity)
                .padding(.trailing, Constants.Layout.trailingPadding)
                .onTapGesture {
                    userInput.removeAll()
                }
            }
        .foregroundColor(Constants.Color.fontColor)
        .background(Constants.Color.bgColor)
        .clipShape(RoundedRectangle(cornerRadius: Constants.Layout.cornerRadius))
        .overlay{
            RoundedRectangle(cornerRadius: Constants.Layout.cornerRadius)
                .stroke(Asset.Colors.fontColor.swiftUIColor.opacity(Constants.Layout.borderOpacity))
        }
    }
}
