//
//  CoffeeShopCollectionCell.swift
//  Coffee Now
//
//  Created by ericzero on 3/23/23.
//

import UIKit

class CoffeeShopCollectionCell: UICollectionViewCell {
    
    lazy var contentV: UIView = {
        let contentV = UIView()
        contentV.backgroundColor = .clear
        contentV.clipsToBounds = true
        contentV.layer.cornerRadius = 8
        contentV.layer.shadowColor = UIColor.black.cgColor
        contentV.layer.shadowOpacity = 0.5
        contentV.layer.shadowOffset = CGSize(width: 2, height: 2)
        contentV.layer.shadowRadius = 5
        return contentV
    }()
    
    lazy var contentImage: UIImageView = {
        let contentImage = UIImageView()
        contentImage.contentMode = .scaleToFill
        contentImage.clipsToBounds = true
        contentImage.layer.cornerRadius = 6
        return contentImage
    }()
    
    lazy var contentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.font = .systemFont(ofSize: 12, weight: .medium)
        contentLabel.numberOfLines = 1
        return contentLabel
    }()
    
    lazy var orderLabel: UILabel = {
        let orderLabel = UILabel()
        orderLabel.font = .systemFont(ofSize: 12, weight: .medium)
        orderLabel.numberOfLines = 1
        orderLabel.textColor = .orange
        return orderLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints(){
        self.contentView.addSubview(contentV)
        contentV.addSubview(contentImage)
        contentV.addSubview(contentLabel)
        contentV.addSubview(orderLabel)
        
        contentV.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentImage.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.left.equalTo(0)
            make.bottom.equalTo(-10)
            make.width.equalTo(68)
            make.height.equalTo(68)
        }
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.left.equalTo(contentImage.snp.right).offset(12)
            make.right.equalTo(-12)
        }
        orderLabel.snp.makeConstraints { make in
            make.left.equalTo(contentImage.snp.right).offset(12)
            make.bottom.equalTo(-14)
            make.right.equalTo(-12)
        }
    }
    
    func updateCell(data: CoffeeShop){
        contentImage.image = data.contentImg
        contentLabel.text = data.nameLabel
        orderLabel.text = data.orderLbl
    }
}
