//
//  CoinsListViewController.swift
//  MarketCoins
//
//  Created by Jaqueline Oliveira on 05/05/23.
//  

import UIKit

protocol CoinsListDisplayLogic: AnyObject {
    func displayGlobalValues(viewModel: CoinsList.FetchGlobalValues.ViewModel)
    func displayListCoins(viewModel: CoinsList.FetchListCoins.ViewModel)
    func displayError(error: String)
}

class CoinsListViewController: UIViewController {
    
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont(name:"HelveticaNeue-bold", size: 20)
        titleLabel.text = "Market Coins"
        titleLabel.textAlignment = .left
        
        return titleLabel
        
    }()
    
    lazy var globalValuesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.width/2, height: 40)
        let globalValuesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        globalValuesCollectionView.register(GlobalValuesCollectionViewCell.self, forCellWithReuseIdentifier: "GlobalValuesCollectionViewCell")
        globalValuesCollectionView.backgroundColor = .none
        globalValuesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        globalValuesCollectionView.showsHorizontalScrollIndicator = false
        
        return globalValuesCollectionView
    }()
    lazy var filterCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.width/3, height: 40)
        let filterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        filterCollectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: "FilterCollectionViewCell")
        filterCollectionView.backgroundColor = .none
        filterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        filterCollectionView.showsHorizontalScrollIndicator = false
        
        return filterCollectionView
    }()
    
    lazy var coinTableView: UITableView = {
        let coinTableView = UITableView(frame: .zero)
        coinTableView.translatesAutoresizingMaskIntoConstraints = false
        coinTableView.showsVerticalScrollIndicator = false
        coinTableView.register(CoinTableViewCell.self, forCellReuseIdentifier: "CoinTableViewCell")
        coinTableView.backgroundColor = .none
        coinTableView.sectionHeaderTopPadding = 0
           
        return coinTableView
    }()
    

    private var globalViewModel: CoinsList.FetchGlobalValues.ViewModel?
    private var coinsViewModel: CoinsList.FetchListCoins.ViewModel?
    
    
    var interactor: CoinsListBusinessLogic?
    var router: (NSObjectProtocol & CoinsListRoutingLogic & CoinsListDataPassing)?

    
    override init(nibName nibNameOrNil: String?,
                  bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
  }
  
  // MARK: Setup
  
  private func setup() {
      
      let viewController = self
      let interactor = CoinsListInteractor()
      let presenter = CoinsListPresenter()
      let router = CoinsListRouter()
      viewController.interactor = interactor
      viewController.router = router
      interactor.presenter = presenter
      presenter.viewController = viewController
      router.viewController = viewController
      router.dataStore = interactor
  }

  override func viewDidLoad() {
      
      super.viewDidLoad()
      doFetchGlobalValues()
      doFetchListCoins()
      createViews()
      createConstraints()
      globalValuesCollectionView.delegate = self
      globalValuesCollectionView.dataSource = self
      filterCollectionView.delegate =  self
      filterCollectionView.dataSource = self
      coinTableView.delegate = self
      coinTableView.dataSource = self
  }
    
    func createViews() {
        view.addSubview(self.container)
        container.addSubview(self.titleLabel)
        container.addSubview(self.globalValuesCollectionView)
        container.addSubview(self.filterCollectionView)
        container.addSubview(self.coinTableView)
    }
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            
            self.container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.container.topAnchor.constraint(equalTo: view.topAnchor),
            self.container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            self.titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            self.titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            self.titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 100),
           
            self.globalValuesCollectionView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            self.globalValuesCollectionView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            self.globalValuesCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            self.globalValuesCollectionView.heightAnchor.constraint(equalToConstant: 45),
            
            self.filterCollectionView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            self.filterCollectionView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            self.filterCollectionView.topAnchor.constraint(equalTo: globalValuesCollectionView.bottomAnchor, constant: 15),
            self.filterCollectionView.heightAnchor.constraint(equalToConstant: 40),
            
            
            self.coinTableView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            self.coinTableView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            self.coinTableView.topAnchor.constraint(equalTo: filterCollectionView.bottomAnchor, constant: 15),
            self.coinTableView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 10),
            
   
        ])
    }
  
    func doFetchGlobalValues() {
        let request = CoinsList.FetchGlobalValues.Request(baseCoin: "brl")
        interactor?.doFetchGlobalValues(request: request)
    }
    
    func doFetchListCoins() {
        let request = CoinsList.FetchListCoins.Request(
            baseCoin: "brl",
            orderBy: "market_cap_desc",
            top: 10,
            pricePercentage: "1h"
        )
        interactor?.doFetchListCoins(request: request)
    }
}

extension CoinsListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == globalValuesCollectionView {
            
            return globalViewModel?.globalValues.count ?? 0
        }
        
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == globalValuesCollectionView {
            
            guard let viewModel = globalViewModel else { return UICollectionViewCell() }
            
            
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GlobalValuesCollectionViewCell.identifier, for: indexPath) as? GlobalValuesCollectionViewCell {
                
                let globalValues = viewModel.globalValues[indexPath.row]
                cell.titleLabel.text = globalValues.title
                cell.valueLabel.text = globalValues.values
                cell.setupViewCell()
                
                return cell
            }
        }
        
        if collectionView == filterCollectionView {
            
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.identifier, for: indexPath) as? FilterCollectionViewCell {
                
                cell.setupFilterViewCell()
                
                return cell
            }
        }
        
        return UICollectionViewCell()
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if collectionView == globalValuesCollectionView {
//            let width = view.frame.width
//            let height = view.frame.height
//
//            return CGSize(width: width, height: height)
//
//        } else {
//            let width = view.frame.width
//            let height = view.frame.height
//
//            return CGSize(width: width, height: height)
//        }
//    }
}

extension CoinsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        return 20
        
        return coinsViewModel?.coins.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: CoinTableViewCell.identifier, for: indexPath) as? CoinTableViewCell {
            guard let viewModel = coinsViewModel else { return  UITableViewCell() }
            
            let coin = viewModel.coins[indexPath.row]
            cell.rankLabel.text = coin.rank
            cell.iconImageView.loadImage(from: coin.iconUrl)
            cell.symbolLabel.text = coin.symbol
            cell.priceLabel.text = coin.price
            cell.percentageLabel.text = coin.priceChangePercentage
            cell.marketCaputalizationLabel.text = coin.marketCapitalization
            cell.setupTableViewCell()
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

}


extension CoinsListViewController: CoinsListDisplayLogic {
    func displayGlobalValues(viewModel: CoinsList.FetchGlobalValues.ViewModel) {
        globalViewModel = viewModel
        DispatchQueue.main.async {
            self.globalValuesCollectionView.reloadData()
        }
    }
    
    func displayListCoins(viewModel: CoinsList.FetchListCoins.ViewModel) {
        coinsViewModel = viewModel
        DispatchQueue.main.async {
            self.coinTableView.reloadData()            
        }
    }
    
    func displayError(error: String) {
        print(error)
    }
}
