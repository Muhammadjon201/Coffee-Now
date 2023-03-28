//
//  HomeDetailNameTableCell.swift
//  Coffee Now
//
//  Created by ericzero on 3/28/23.
//

import UIKit

class HomeDetailNameTableCell: UITableViewCell {
    
    lazy var contentV: UIView = {
        let contentV = UIView()
        contentV.backgroundColor = .clear
        return contentV
    }()
    
    lazy var coffeeName: UILabel = {
        let coffeeName = UILabel()
        coffeeName.numberOfLines = 1
        coffeeName.font = .systemFont(ofSize: 18, weight: .semibold)
        coffeeName.text = "Macchiato Short"
        return coffeeName
    }()

    lazy var coffeeSubName: UILabel = {
        let coffeeSubName = UILabel()
        coffeeSubName.numberOfLines = 1
        coffeeSubName.font = .systemFont(ofSize: 12)
        coffeeSubName.text = "Macchiato Short"
        return coffeeSubName
    }()
    
    lazy var coffeePrice: UILabel = {
        let coffeePrice = UILabel()
        coffeePrice.numberOfLines = 1
        coffeePrice.font = .systemFont(ofSize: 18)
        coffeePrice.textColor = .orange
        coffeePrice.text = "$5.00"
        return coffeePrice
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setElements(){
        self.contentView.addSubview(contentV)
        contentV.addSubview(coffeeName)
        contentV.addSubview(coffeeSubName)
        contentV.addSubview(coffeePrice)
        
        contentV.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        coffeeName.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.left.equalTo(20)
        }
        
        coffeePrice.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.right.equalTo(-20)
            //make.left.equalTo(coffeeName.snp.right).offset(10)
        }
        
        coffeeSubName.snp.makeConstraints { make in
            make.top.equalTo(coffeeName.snp.bottom).offset(4)
            make.left.equalTo(20)
        }
    }
    
}
