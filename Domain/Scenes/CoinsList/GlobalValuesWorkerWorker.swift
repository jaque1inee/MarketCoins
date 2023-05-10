//
//  GlobalValuesWorkerWorker.swift
//  MarketCoins
//
//  Created by Jaqueline Oliveira on 05/05/23.
//

import UIKit

class GlobalValuesWorkerWorker {
    
    private let dataProvider: GlobalValuesDataProvider?
    private var completion: ((Result<GlobalModel?, CryptocurrenciesError>) -> Void)?
    
    init (dataProvider: GlobalValuesDataProvider = GlobalValuesDataProvider()) {
        self.dataProvider =  dataProvider
        self.dataProvider?.delegate = self
    }
    
    func doFetchGlobalValues(completion: @escaping ((Result<GlobalModel?, CryptocurrenciesError>) -> Void)) {
        dataProvider?.fetchGlobalValues()
        self.completion =  completion
        
    }
    
}

extension GlobalValuesWorkerWorker: GlobalValuesDataProviderDelegate {
    func sucess(model: Any) {
        guard let completion = completion else {
            fatalError("Completion not implemented")
        }
        completion(.success(model as? GlobalModel))
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
