//
//  CoinsListRouter.swift
//  MarketCoins
//
//  Created by Jaqueline Oliveira on 05/05/23.
//

import UIKit

@objc protocol CoinsListRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol CoinsListDataPassing
{
  var dataStore: CoinsListDataStore? { get }
}

class CoinsListRouter: NSObject, CoinsListRoutingLogic, CoinsListDataPassing
{
  weak var viewController: CoinsListViewController?
  var dataStore: CoinsListDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: CoinsListViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: CoinsListDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
