//
//  NewsModel.swift
//  CryptoApp
//
//  Created by yulias on 27/12/2023.
//

import SwiftUI

struct NewsModel: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let content: String
    let image: String
    let date: String
    let comments: Int
    let hashtags: String
    
    var hashtagsString: String {
        return "#\(hashtags)"
    }
    
    var numberOfComments: String {
        return "\(comments)"
    }
    
    var minOfReading: String {
        var numberOfMinutes: Int {
            let roundedNumber = ceil(Double(content.count) / Constants.Numbers.averageCharsNumber)
            return Int(roundedNumber)
        }
        let minuteWord: String = numberOfMinutes == Constants.Numbers.oneMinute ?
        Constants.Text.min : Constants.Text.mins
        return "\(numberOfMinutes) \(minuteWord) \(Constants.Text.reading)"
    }
}

extension NewsModel {
    
    private enum Constants {
        enum Numbers {
            static let averageCharsNumber: Double = 850 // a person normaly reads 850 chars per minute
            static let oneMinute: Int = 1
        }
        enum Text {
            static let min: String = LocalizedString.oneMinute
            static let mins: String = LocalizedString.minutes
            static let reading: String = LocalizedString.reading
        }
    }
    
}
 
