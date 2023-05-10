//
//  GenericDataProvider.swift
//  MarketCoins
//
//  Created by Jaqueline Oliveira on 30/04/23.
//

import Foundation

protocol GenericDataProviderDelegate {
    func sucess(model: Any)
    func errorData(_ provider: GenericDataProviderDelegate?, error: Error)
}

class DataProviderManager<T, S> {
    var delegate: T?
    var model: S?
}

