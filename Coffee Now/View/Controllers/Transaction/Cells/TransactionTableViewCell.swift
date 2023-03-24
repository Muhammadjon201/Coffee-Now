//
//  TransactionTableViewCell.swift
//  Coffee Now
//
//  Created by ericzero on 3/23/23.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    lazy var contentV: UIView = {
        let contentV = UIView()
        contentV.backgroundColor = .clear
        contentV.clipsToBounds = true
        contentV.layer.cornerRadius = 8
        
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
    
    lazy var itemLbl: UILabel = {
        let itemLbl = UILabel()
        itemLbl.font = .systemFont(ofSize: 12, weight: .medium)
        itemLbl.numberOfLines = 1
        return itemLbl
    }()
    
    lazy var dateLbl: UILabel = {
        let dateLbl = UILabel()
        dateLbl.font = .systemFont(ofSize: 10, weight: .medium)
        dateLbl.numberOfLines = 1
        dateLbl.textColor = UIColor.systemGray2
        return dateLbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews(){
        self.contentView.addSubview(contentV)
        contentV.addSubview(contentImage)
        contentV.addSubview(contentLabel)
        contentV.addSubview(orderLabel)
        contentV.addSubview(dateLbl)
        contentV.addSubview(itemLbl)
        
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
            make.right.equalTo(dateLbl.snp.left).offset(-5)
        }
        itemLbl.snp.makeConstraints { make in
            make.centerY.equalTo(contentV)
            make.left.equalTo(contentImage.snp.right).offset(12)
        }
        orderLabel.snp.makeConstraints { make in
            make.left.equalTo(contentImage.snp.right).offset(12)
            make.bottom.equalTo(-14)
            make.right.equalTo(-12)
        }
        dateLbl.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.right.equalTo(-12)
        }
    }
    
    func updateCell(data: TransactionsData){
        contentImage.image = data.contentImg
        itemLbl.text = data.itemsLbl
        orderLabel.text = data.orderLbl
        contentLabel.text = data.nameLabel
        dateLbl.text = data.dateLbl
    }
}
