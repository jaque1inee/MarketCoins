//
//  CoinsListPresenter.swift
//  MarketCoins
//
//  Created by Jaqueline Oliveira on 05/05/23.
//


import UIKit

protocol CoinsListPresentationLogic {
    func presentGlobalValues(response: CoinsList.FetchGlobalValues.Response)
    func presentListCoins(response: [CoinsList.FetchListCoins.Response])
    func presentError(error: CryptocurrenciesError)
}

class CoinsListPresenter: CoinsListPresentationLogic {
    
    weak var viewController: CoinsListDisplayLogic?
    
    func presentGlobalValues(response: CoinsList.FetchGlobalValues.Response) {
        var globalValues: [CoinsList.FetchGlobalValues.ViewModel.GlobalValues] = []
        
        for (_, value) in response.totalMarketCap {
            globalValues.append(
                CoinsList.FetchGlobalValues.ViewModel.GlobalValues(
                    title: "Capitalização de Mercado Global",
                    values: value.toCurrency()
                )
            )
        }
        
        for (_, value) in response.totalVolume {
            globalValues.append(
                CoinsList.FetchGlobalValues.ViewModel.GlobalValues(
                    title: "Volume em 24hs",
                    values: value.toCurrency()
                )
            )
        }
        
        let viewModel = CoinsList.FetchGlobalValues.ViewModel(globalValues: globalValues
        )
        
        viewController?.displayGlobalValues(viewModel: viewModel)
    }
    
    func presentListCoins(response: [CoinsList.FetchListCoins.Response]) {
        
        let coins = response.map { response in
            var rank = "-"
            
            if let marketCapRank = response.marketCapRank {
                rank = "\(marketCapRank)"
            }
            
            return CoinsList.FetchListCoins.ViewModel.Coin(
                id: response.id,
                name: response.name,
                rank: rank,
                iconUrl: response.image,
                symbol: response.symbol.uppercased(),
                price: response.currentPrice.toCurrency(),
                priceChangePercentage: response.priceChangePercentage.toPercentage(),
                marketCapitalization: response.marketCap.toCurrency()
            )
        }
        
        let viewModel = CoinsList.FetchListCoins.ViewModel(
            coins: coins
        )
        
        
        viewController?.displayListCoins(viewModel: viewModel)
    }
    
    func presentError(error: CryptocurrenciesError) {
        
        viewController?.displayError(error: error.errorDescription)
    
    }
}
