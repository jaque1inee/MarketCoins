//
//  CoinTableViewCell.swift
//  MarketCoins
//
//  Created by Jaqueline Oliveira on 08/05/23.
//

import UIKit

class CoinTableViewCell: UITableViewCell {
    
    static let identifier = "CoinTableViewCell"
    
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
//        view.layer.cornerRadius = 15
//        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var childStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        
        return stackView
    }()
    
    lazy var rankLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont(name:"HelveticaNeue", size: 12)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
    
        return titleLabel
        
    }()
    
    lazy var imageStackView: UIStackView = {
        let imageStackView = UIStackView()
        imageStackView.alignment = .center
        imageStackView.axis = .vertical
        imageStackView.distribution = .equalCentering
        imageStackView.translatesAutoresizingMaskIntoConstraints = false
        imageStackView.spacing = 5
        
        
        return imageStackView
    }()
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
//        iconImageView.layer.cornerRadius = 15
//        iconImageView.layer.masksToBounds = true
//        iconImageView.backgroundColor = .lightGray
        
        return iconImageView
    }()
    
    lazy var symbolLabel: UILabel = {
        let symbolLabel = UILabel()
        symbolLabel.font = UIFont(name:"HelveticaNeue", size: 12)
        symbolLabel.textAlignment = .center
        symbolLabel.translatesAutoresizingMaskIntoConstraints = false
        symbolLabel.textColor = .white
        symbolLabel.numberOfLines = 0
    
        return symbolLabel
        
    }()
    
    lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.font = UIFont(name:"HelveticaNeue", size: 12)
        priceLabel.textAlignment = .center
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.textColor = .white
        priceLabel.numberOfLines = 0
    
        return priceLabel
        
    }()
    
    
    
    lazy var percentageLabel: UILabel = {
        let percentageLabel = UILabel()
        percentageLabel.font = UIFont(name:"HelveticaNeue", size: 12)
        percentageLabel.textAlignment = .center
        percentageLabel.translatesAutoresizingMaskIntoConstraints = false
        percentageLabel.textColor =  .white
        percentageLabel.numberOfLines = 0
    
        return percentageLabel
        
    }()
    
    lazy var marketCaputalizationLabel: UILabel = {
        let marketCaputalizationLabel = UILabel()
        marketCaputalizationLabel.font = UIFont(name:"HelveticaNeue", size: 12)
        marketCaputalizationLabel.textAlignment = .center
        marketCaputalizationLabel.translatesAutoresizingMaskIntoConstraints = false
        marketCaputalizationLabel.textColor = .white
        marketCaputalizationLabel.numberOfLines = 0
    
        return marketCaputalizationLabel
        
    }()
    

    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupTableViewCell() {
        createViews()
        createConstraints()
        
    }
    
    func createViews() {
        contentView.addSubview(container)
        container.addSubview(childStackView)
        childStackView.addArrangedSubview(rankLabel)
        childStackView.addArrangedSubview(imageStackView)
        imageStackView.addArrangedSubview(iconImageView)
        imageStackView.addArrangedSubview(symbolLabel)
        childStackView.addArrangedSubview(priceLabel)
        childStackView.addArrangedSubview(percentageLabel)
        childStackView.addArrangedSubview(marketCaputalizationLabel)
//        container.addSubview(rankLabel)
//        container.addSubview(iconImageView)
//        container.addSubview(symbolLabel)
//        container.addSubview(priceLabel)
//        container.addSubview(percentageLabel)
//        container.addSubview(marketCaputalizationLabel)
    }
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            self.container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            self.container.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            self.container.heightAnchor.constraint(equalToConstant: 140),
            
            self.childStackView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            self.childStackView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            self.childStackView.topAnchor.constraint(equalTo: container.topAnchor),
            self.childStackView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            
            
            
            self.rankLabel.leadingAnchor.constraint(equalTo: childStackView.leadingAnchor, constant: 8),
//            self.rankLabel.trailingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: -20),
//            self.rankLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            
            self.imageStackView.leadingAnchor.constraint(equalTo: rankLabel.trailingAnchor, constant: 4),
//
//
            self.iconImageView.leadingAnchor.constraint(equalTo: imageStackView.leadingAnchor, constant: 10),
            self.iconImageView.topAnchor.constraint(equalTo: imageStackView.topAnchor, constant: 5),
            self.iconImageView.heightAnchor.constraint(equalToConstant: 20),
            self.iconImageView.widthAnchor.constraint(equalToConstant: 20),

//            self.symbolLabel.leadingAnchor.constraint(equalTo: imageStackView.leadingAnchor),
//            self.symbolLabel.topAnchor.constraint(equalTo: iconImageView.topAnchor, constant: 5),
//            self.symbolLabel.bottomAnchor.constraint(equalTo: imageStackView.bottomAnchor, constant: 5),

//            self.priceLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 40),
//            self.priceLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
//            self.priceLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 10),
//
//            self.percentageLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 10),
//            self.percentageLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 2),
//            self.percentageLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 2),
//
//            self.marketCaputalizationLabel.leadingAnchor.constraint(equalTo: percentageLabel.trailingAnchor, constant: 10),
//            self.marketCaputalizationLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 2),
//            self.marketCaputalizationLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 2),
//            self.marketCaputalizationLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10)
            
        ])
    }
}
