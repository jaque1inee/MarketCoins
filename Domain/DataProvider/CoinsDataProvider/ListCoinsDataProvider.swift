//
//  LisCoinsDataProvider.swift
//  MarketCoins
//
//  Created by Jaqueline Oliveira on 05/05/23.
//

import Foundation

protocol ListCoinsDataProviderDelegate: GenericDataProviderDelegate {}

class ListCoinsDataProvider: DataProviderManager <ListCoinsDataProviderDelegate, [CoinModel]> {
    private let coinsStore: CoinsStoreProtocol?
    
    init(coinsStore: CoinsStoreProtocol = CoinsStore()) {
        self.coinsStore =  coinsStore
    }
    
    func fetchListCoins(by vsCurrency: String,
                        with crytocurrency: [String]?,
                        orderBy order: String,
                        total parPage: Int,
                        page: Int,
                        percentagePrice: String ) {
        coinsStore?.fetchListCoins(by: vsCurrency,
                                   with: crytocurrency,
                                   orderBy: order,
                                   total: parPage,
                                   page: page,
                                   percentagePrice: percentagePrice,
                                   completion: { result, error in
            if let error {
                self.delegate?.errorData(self.delegate, error: error)
            }
            
            if let result {
                self.delegate?.sucess(model: result)
            }
        })
    }
}

//https://api.www.coingecko.com/api/v3/coins/markets?
//order=market_cap_desc&
//per_page=10&
//sparkline=false&
//page=1&
//vs_currency=brl
//&price_change_percentage=1h
////
////
//
//https://api.coingecko.com/api/v3/coins/markets?
//vs_currency=brl&
//order=market_cap_desc&
//per_page=10&
//page=1&
//sparkline=false&
//price_change_percentage=1h&
//locale=en
