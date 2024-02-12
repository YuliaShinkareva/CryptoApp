//
//  MockNews.swift
//  CryptoApp
//
//  Created by yulias on 10.01.24.
//

import SwiftUI

final class MockNewsData: ObservableObject {
    
    @Published var data: [NewsModel] = [
        
        NewsModel(title: "'Rich Dad Poor Dad' Author Kiyosaki Gives Epic Bitcoin Price Prediction",
                 content: """
                 U.Today - In a stunning turn of events, the SEC's official X account faced a security breach on Tuesday. An unauthorized post claimed that the agency had greenlit the launch of the. However, SEC Chair Gary Gensler swiftly clarified that the agency had not approved any such ETFs, and the misleading post, now deleted, originated from an unauthorized user.
                 
                 Notably, the acclaimed author of the best-selling book \"Rich Dad Poor Dad,\" reacted to the news with significant commentary. Expressing enthusiasm for the prospect of a Bitcoin ETF, Kiyosaki highlighted his satisfaction with having invested in Bitcoin years ago. He boldly predicted a surge in Bitcoin's value to $150,000 shortly.
                 
                 Kiyosaki also foresaw a bullish trajectory for gold, attributing it to central banks' accumulating and holding the precious metal. In contrast, he anticipated a decline in silver prices as some sellers might liquidate their holdings to meet financial obligations amid rising inflation.
                 """,
                 image: "news1",
                 date: "today 9:35 AM",
                 comments: 103,
                 hashtags: "BTC, ETH"),
        
        NewsModel(title: "Dogecoin price fluctuates on false report of mascot's death",
                 content: """
                 The cryptocurrency Dogecoin recently witnessed a sharp but brief increase in value, sparked by a false report circulating on Telegram that claimed the death of its famed mascot, Kabuso. The misinformation briefly pushed Dogecoin's price up to 8.3 cents, marking a 9% surge, before it stabilized at around 8 cents.
                 
                 The false news, disseminated by an unidentified user, led to over $674,000 in liquidations as traders reacted to the unverified claim. This event underscored the vulnerability of cryptocurrencies like Dogecoin to sudden market movements based on rumors and highlights the broader impact that unverified information can have on digital asset valuations.
                 
                 Despite the temporary disturbance, Dogecoin continues to hold a substantial position in the cryptocurrency market, with a reported capitalization of $11 billion. The incident serves as a reminder of the inherent volatility within the crypto markets and the importance of critical evaluation of news sources within the investment community.
                 """,
                 image: "news2",
                 date: "yesterday 10:12 AM",
                 comments: 213,
                 hashtags: "USDT, XRP"),
        
        NewsModel(title: "Ethereum (ETH) Loses Fight Against Bitcoin (BTC): No Alt Season?",
                 content: """
                 U.Today - The Ethereum to ratio is a critical metric that is important to constantly monitor if you are operating with altcoins. This ratio signifies Ethereum's value relative to Bitcoin, and its movements can indicate general trends on the market. Recently, the ETH/BTC chart has shown a significant downtrend, which suggests that Bitcoin retains its dominance in the cryptocurrency space.
                 
                 The chart illustrates that Ethereum has not been able to outpace Bitcoin in terms of investment returns. This is particularly significant for investors who aim to \"beat\" the market by selecting assets that could potentially yield higher returns than Bitcoin. Currently, the performance of Ethereum, when measured against Bitcoin, has been less than stellar, indicating that Bitcoin remains the market leader and a stronger investment choice in the cryptocurrency realm.
                 """,
                 image: "news3",
                 date: "yesterday 12:35 PM",
                 comments: 407,
                 hashtags: "USD"),
        
        NewsModel(title: "Bitcoin (BTC) 30% Pump Will Break All-Time High: Here's Potential Date",
                 content: """
                 U.Today - is on the brink of a historic moment, with price action hinting at an impending breakthrough that could set new standards for the original cryptocurrency. With the upcoming approval of a, market sentiment is bullish, and there is a possibility of a price surge.
                 
                 Market makers, having taken a step back, have primed the market for a dramatic move; the announcement of the Bitcoin ETF in the following week could catalyze a wick above the all-time high with just a few outsized orders.
                 
                 BTC/USD Chart by TradingViewThe technical analysis of the chart reveals a poised asset, with local resistance being tested and support levels holding firm. A glance at the chart indicates that the 50-day moving average is well below the current price, acting as a strong support level, with the 200-day MA tracing an even steeper ascent, further bolstering the bullish setup. The current price hovers near a critical resistance level, and a convincing break above this level could signal the start of a significant rally.
                 """,
                 image: "news4",
                 date: "Jan 10, 2024 11:37 AM",
                 comments: 399,
                 hashtags: "BTC, USD"),
        
        NewsModel(title: "X confirms SEC account was compromised in Bitcoin ETF debacle",
                 content: """
                 Investing.com -- Social media platform X said on Wednesday that the Securities and Exchange Commission’s account was compromised when it made a fake post about the regulator approving a spot Bitcoin exchange-traded fund.
                 
                 In a post, the social media platform formerly known as Twitter said that a preliminary investigation showed the account was compromised by a third party gaining access to a phone number associated with the SEC, and that the account did not have two-factor authentication enabled at the time of the breach.
                 
                 The announcement comes just a few hours after the SEC’s official X account issued a post that appeared to say that the regulator had approved the listing of an ETF directly tracking the spot price of Bitcoin.
                 
                 The fake post read: "Today the SEC grants approval for #Bitcoin ETFs for listing on all registered national securities exchanges."
                 
                 Chair Gary Gensler almost immediately responded to the announcement, stating that the official SEC account was compromised and that the post was “unauthorized.”
                 """,
                 image: "news5",
                 date: "Jan 9, 2024 7:21 PM",
                 comments: 177,
                 hashtags: "ETH, LTC")
        
    ]
    
}


