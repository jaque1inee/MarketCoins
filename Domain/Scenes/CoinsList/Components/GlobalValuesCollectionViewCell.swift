//
//  GlobalValuesCollectionViewCell.swift
//  MarketCoins
//
//  Created by Jaqueline Oliveira on 08/05/23.
//

import UIKit

class GlobalValuesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "GlobalValuesCollectionViewCell"
    
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont(name:"HelveticaNeue", size: 11)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.white
        titleLabel.numberOfLines = 0
    
        return titleLabel
        
    }()
    
    lazy var valueLabel: UILabel = {
        let valueLabel = UILabel()
        valueLabel.font = UIFont(name:"HelveticaNeue", size: 12)
        valueLabel.textAlignment = .center
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.textColor = UIColor.white
        valueLabel.numberOfLines = 0
    
        return valueLabel
    }()
 
    func setupViewCell(){
        createViews()
        createConstraints()
    }
    
    
    func createViews() {
        contentView.addSubview(container)
        container.addSubview(titleLabel)
        container.addSubview(valueLabel)
    }
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            
            self.container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            self.container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.container.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            self.container.widthAnchor.constraint(equalToConstant: 150),
//            self.container.heightAnchor.constraint(equalToConstant: 30),
            
            self.titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 5),
            self.titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: -5),
            self.titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 5),
            
            self.valueLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 5),
            self.valueLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: -5),
            self.valueLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 10),
            self.valueLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -5)

        ])
    }
    
}
