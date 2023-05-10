//
//  CoinsListWorker.swift
//  MarketCoins
//
//  Created by Jaqueline Oliveira on 05/05/23.
//

import UIKit

class CoinsListWorker {
    
    private let dataProvider: ListCoinsDataProvider?
    private var completion: ((Result<[CoinModel]?, CryptocurrenciesError>) -> Void)?
    
    init (dataProvider: ListCoinsDataProvider = ListCoinsDataProvider()) {
        self.dataProvider =  dataProvider
        self.dataProvider?.delegate = self
    }
    
    func doFetchListCoins(baseCoin: String,
                          orderBy: String,
                          top: Int,
                          percentagePrice: String,
                          completion: @escaping (Result<[CoinModel]?, CryptocurrenciesError>) -> Void) {
        
        dataProvider?.fetchListCoins(by: baseCoin,
                                     with: nil,
                                     orderBy: orderBy,
                                     total: top, page: 1,
                                     percentagePrice: percentagePrice)
        self.completion = completion
    }
    
}

extension CoinsListWorker: ListCoinsDataProviderDelegate {
    func sucess(model: Any) {
        guard let completion = completion else {
            fatalError("Completion not implemented")
        }
        
        completion(.success(model as? [CoinModel]))
    }
    
    func errorData(_ provider: GenericDataProviderDelegate?, error: Error) {
        guard let completion = completion else {
            fatalError("Completion not implemented!")
        }
        
        if error.errorCode == 500 {
            completion(.failure(.internalServerError))
        } else if error.errorCode == 400 {
            completion(.failure(.badRequestError))
        } else if error.errorCode == 404 {
            completion(.failure(.notFoundError))
        } else {
            completion(.failure(.undefinedError))
        }
    }
}
