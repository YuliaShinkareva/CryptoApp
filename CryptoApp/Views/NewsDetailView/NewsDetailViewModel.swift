//
//  NewsDetailViewModel.swift
//  CryptoApp
//
//  Created by yulias on 11.01.24.
//

import SwiftUI

final class NewsDetailViewModel: ObservableObject {
    @Published var screenSize: CGSize = .zero
    @Binding var path: [NewsModel]

    init(path: Binding<[NewsModel]>) {
        self._path = path
    }
    
    var imageWidth: CGFloat {
        screenSize.width
    }
    var imageHeight: CGFloat {
        screenSize.height / Constants.Layout.imageHeightDivider
    }
    
    func updateScreenSize(with size: CGSize) {
        screenSize = size
    }
    
    func deleteOnSwipe(_ swipeDirection: Double) {
        if swipeDirection > .zero {
            path.removeLast()
        }
    }
}

extension NewsDetailViewModel {
    
    private enum Constants {
        enum Layout {
            static let imageHeightDivider: CGFloat = 2
        }
    }
    
}


