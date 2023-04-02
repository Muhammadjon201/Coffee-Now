//
//  RecommendedCollectionCell.swift
//  Coffee Now
//
//  Created by ericzero on 3/22/23.
//

import UIKit

class RecommendedCollectionCell: UICollectionViewCell {
        
    lazy var contentV: UIView = {
        let contentV = UIView()
        contentV.clipsToBounds = true
        contentV.layer.cornerRadius = 10
        contentV.backgroundColor = .systemGray5
        return contentV
    }()
    
    lazy var heartIcon: UIImageView = {
        let heartIcon = UIImageView()
        return heartIcon
    }()
    
    lazy var contentImg: UIImageView = {
        let contentImg = UIImageView()
        contentImg.contentMode = .scaleToFill
        contentImg.clipsToBounds = true
        contentImg.layer.cornerRadius = 10
        return contentImg
    }()
    
    lazy var contentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.numberOfLines = 1
        contentLabel.font = .systemFont(ofSize: 12)
        return contentLabel
    }()
    
    lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.numberOfLines = 1
        priceLabel.font = .systemFont(ofSize: 18)
        priceLabel.textColor = .orange
        return priceLabel
    }()
    
    lazy var basketIcon: UIImageView = {
        let basketIcon = UIImageView()
        return basketIcon
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews(){
        contentView.addSubview(contentV)
        contentV.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentV.addSubview(contentImg)
        contentImg.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(150)
        }
        
        contentImg.addSubview(heartIcon)
        heartIcon.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.right.equalTo(-12)
            make.width.height.equalTo(22)
        }
        
        contentV.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(contentImg.snp.bottom).offset(8)
            make.left.equalTo(10)
        }
        
        contentV.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(10)
            make.left.equalTo(10)
        }
        
        contentV.addSubview(basketIcon)
        basketIcon.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.right.equalTo(-10)
            make.width.height.equalTo(26)
        }
    }
    
    func updateCell(data: RecommendedCollectionViewData){
        contentImg.image = data.contentImg
        heartIcon.image = data.contentIcon
        contentLabel.text = data.contentLabel
        priceLabel.text = data.coffeePrice
        basketIcon.image = data.basketImage
    }
}
