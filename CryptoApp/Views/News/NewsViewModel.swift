//
//  NewsViewModel.swift
//  CryptoApp
//
//  Created by yulias on 27/12/2023.
//

import SwiftUI

final class NewsViewModel: ObservableObject {
    
    @Published var news = MockNewsData().data
    @Published var userInput: String = ""
    @Published var newsNavigationStack: [NewsModel] = []
    
    private let data = MockNewsData().data
    
    func searchCryptoNews(){
        if userInput == "" {
            news = data
        } else {
            news = data.filter{$0.content.contains(userInput)}
        }
    }
}

 
