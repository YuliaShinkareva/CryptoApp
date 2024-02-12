//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by yulias on 22.12.23.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreen(viewModel: SplashScreenViewModel())
        }
    }
}
