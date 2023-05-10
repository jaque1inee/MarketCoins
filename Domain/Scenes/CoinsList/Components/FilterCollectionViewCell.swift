//
//  FilterCollectionViewCell.swift
//  MarketCoins
//
//  Created by Jaqueline Oliveira on 08/05/23.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FilterCollectionViewCell"
    
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var filterLabel: UILabel = {
        let filterLabel = UILabel()
        filterLabel.font = UIFont(name:"HelveticaNeue", size: 12)
        filterLabel.textAlignment = .center
        filterLabel.translatesAutoresizingMaskIntoConstraints = false
        filterLabel.textColor = .white
        filterLabel.numberOfLines = 0
    
        return filterLabel
        
    }()
    
    
    func setupFilterViewCell(){
        createViews()
        createConstraints()
    }
    
    
    func createViews() {
        contentView.addSubview(container)
        container.addSubview(filterLabel)
    }
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            
            self.container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            self.container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.container.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            self.filterLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 5),
            self.filterLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: -5),
            self.filterLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 5),
            self.filterLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -5)

        ])
    }
    
    
}
