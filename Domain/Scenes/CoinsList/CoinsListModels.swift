//
//  CoinsListModels.swift
//  MarketCoins
//
//  Created by Jaqueline Oliveira on 05/05/23.
//

import UIKit

enum CoinsList {
    
    enum FetchGlobalValues {
        struct Request {
            let baseCoin: String
        }
        struct Response {
            let baseCoin: String
            let totalMarketCap: [String: Double]
            let totalVolume: [String: Double]
        }
        struct ViewModel {
            struct GlobalValues {
                let title: String
                let values: String
            }
            let globalValues: [GlobalValues]
        }
    }
    
    enum FetchListCoins {
        struct Request {
            let baseCoin: String
            let orderBy: String  
            let top: Int
            let pricePercentage: String
            
        }
        struct Response {
            let baseCoin: String
            let id: String
            let name: String
            let symbol: String
            let image: String
            let currentPrice: Double
            let marketCap: Double
            let marketCapRank: Int?
            let priceChangePercentage: Double
            
        }
        
        struct ViewModel {
            struct Coin {
                let id: String
                let name: String
                let rank: String
                let iconUrl: String
                let symbol: String
                let price: String
                let priceChangePercentage: String
                let marketCapitalization: String
            }
            let coins: [Coin]
        }
    }
}
