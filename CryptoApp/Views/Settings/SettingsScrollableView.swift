//
//  ScrollableView.swift
//  CryptoApp
//
//  Created by yulias on 17/01/2024.
//

import SwiftUI

struct SettingsScrollableView: View {
    
    private enum Constants {
        
        enum Colors {
            static let background = Asset.Colors.backgroundColor.swiftUIColor
            static let font = Asset.Colors.fontColor.swiftUIColor
            static let settingsToggle = Asset.Colors.settingsColor.swiftUIColor
            static let row = Asset.Colors.rowColor.swiftUIColor.opacity(0.7)
        }
        
        enum Layout {
            static let stepperStep: Int = 50
            static let sectionFontSize: CGFloat = 16
        }
        
        enum Text {
            static let chevronRight = LocalizedString.chevronRightIcon
            static let accountSettings = LocalizedString.accountSettings
            static let accountCurrency = LocalizedString.accountCurrency
            static let maxShownAssets = LocalizedString.maxShownAssets
            static let generalSettings = LocalizedString.generalSettings
            static let generalSettingsHeader = LocalizedString.generalSettingsHeader
            static let darkMode = LocalizedString.darkMode
            static let enableNotifications = LocalizedString.enableNotifications
            static let userInformation = LocalizedString.userInformation
            static let personCropCircleFillBadgePlus = LocalizedString.personCropCircleFillBadgePlus
            static let changeProfilePicture = LocalizedString.changeProfilePicture
            static let chevronFill = LocalizedString.chevronFill
            static let envelopeFill = LocalizedString.envelopeFill
            static let changeEmail = LocalizedString.changeEmail
            static let lockFill = LocalizedString.lockFill
            static let changePassword = LocalizedString.changePassword
            static let logOut = LocalizedString.logOut
            static let power = LocalizedString.power
            static let followOnGithub = LocalizedString.followOnGithub
            static let link = LocalizedString.link
            static let settings = LocalizedString.settings
        }
    }
    
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        Form {
            Section(header: Text(Constants.Text.accountSettings)) {
                Picker(Constants.Text.accountCurrency, selection: $viewModel.selectedCurrency) {
                    ForEach(viewModel.getCurrencies(), id: \.self) { currencySymbol in
                        Text(currencySymbol).tag(currencySymbol)
                    }
                    .pickerStyle(WheelPickerStyle())
                }
                .listRowBackground(Constants.Colors.row)
                
                Section {
                    Stepper(value: $viewModel.maxShownAssets,
                            in: Constants.Layout.stepperStep...viewModel.maxAssetsValue,
                            step: viewModel.stepValue)
                    {
                        Text(Constants.Text.maxShownAssets) +
                        Text("\(viewModel.maxShownAssets)")
                            .foregroundColor(.indigo)
                            .bold()
                    }
                    .listRowBackground(Constants.Colors.row)
                }
            }
            
            Section(header: Text(Constants.Text.generalSettings),
                    footer: Text(Constants.Text.generalSettingsHeader)) {
                Toggle(isOn: .constant(true),
                       label: {
                    Text(Constants.Text.darkMode)
                })
                .toggleStyle(SwitchToggleStyle(tint: Constants.Colors.settingsToggle))
                Toggle(isOn: .constant(true),
                       label: {
                    Text(Constants.Text.enableNotifications)
                })
                .toggleStyle(SwitchToggleStyle(tint: Constants.Colors.settingsToggle))
            }
                    .listRowBackground(Constants.Colors.row)
            
            Section(header: Text(Constants.Text.userInformation).foregroundColor(.gray)) {
                Button(action : {
                }) {
                    HStack {
                        Image(systemName: Constants.Text.personCropCircleFillBadgePlus)
                        Text(Constants.Text.changeProfilePicture)
                        Spacer()
                        Image(systemName: Constants.Text.chevronRight)
                            .foregroundColor(.gray)
                    }
                }
                .listRowBackground(Constants.Colors.row)
                
                Button(action: {
                }) {
                    HStack {
                        Image(systemName: Constants.Text.envelopeFill)
                        Text(Constants.Text.changeEmail)
                        Spacer()
                        Image(systemName: Constants.Text.chevronRight)
                            .foregroundColor(.gray)
                    }
                }
                .listRowBackground(Constants.Colors.row)
                
                Button(action : {
                }) {
                    HStack {
                        Image(systemName: Constants.Text.lockFill)
                        Text(Constants.Text.changePassword)
                        Spacer()
                        Image(systemName: Constants.Text.chevronRight)
                            .foregroundColor(.gray)
                    }
                }
                .listRowBackground(Constants.Colors.row)
            }
            .foregroundColor(Constants.Colors.font)
            
            Section {
                Label(Constants.Text.logOut, systemImage: Constants.Text.power)
            }
            .listRowBackground(Constants.Colors.row)
            .foregroundColor(.red)
            .font(.system(size: Constants.Layout.sectionFontSize, weight: .semibold))
            
            Section {
                Label(Constants.Text.followOnGithub, systemImage: Constants.Text.link)
            }
            .listRowBackground(Constants.Colors.row)
            .foregroundColor(.blue)
            .font(.system(size: Constants.Layout.sectionFontSize, weight: .semibold))
        }
        .scrollContentBackground(.hidden)
        .background(Constants.Colors.background)
        .navigationTitle(Constants.Text.settings)
    }
}

struct ScrollableView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsScrollableView(viewModel: SettingsViewModel())
        }
    }
}
