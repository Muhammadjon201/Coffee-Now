//
//  CheckoutTableViewCell.swift
//  Coffee Now
//
//  Created by ericzero on 3/31/23.
//

import UIKit

class CheckoutTableViewCell: UITableViewCell {
    
    lazy var contentV: UIView = {
        let contentV = UIView()
        contentV.backgroundColor = .clear
        return contentV
    }()
    
    lazy var imgV: UIImageView = {
        let imgV = UIImageView()
        imgV.contentMode = .scaleToFill
        imgV.image = UIImage(named: "coffee")
        imgV.clipsToBounds = true
        imgV.layer.cornerRadius = 6
        return imgV
    }()
    
    lazy var coffeeName: UILabel = {
        let coffeeName = UILabel()
        coffeeName.numberOfLines = 1
        coffeeName.font = .systemFont(ofSize: 14, weight: .semibold)
        coffeeName.text = "Macchiato Short"
        return coffeeName
    }()

    lazy var coffeeSubName: UILabel = {
        let coffeeSubName = UILabel()
        coffeeSubName.numberOfLines = 1
        coffeeSubName.font = .systemFont(ofSize: 12)
        coffeeSubName.text = "1 Item"
        return coffeeSubName
    }()
    
    lazy var editBtn: UIButton = {
        let editBtn = UIButton()
        editBtn.setTitle("Edit", for: .normal)
        editBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        editBtn.addTarget(self, action: #selector(editBtnTapped), for: .touchUpInside)
        editBtn.setTitleColor(UIColor.orange, for: .normal)
        return editBtn
    }()
    
    //MARK: - Actions
    
    @objc func editBtnTapped(){
        print("Edit button worked")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setElements(){
        self.contentView.addSubview(contentV)
        contentV.addSubview(imgV)
        contentV.addSubview(coffeeName)
        contentV.addSubview(coffeeSubName)
        contentV.addSubview(editBtn)
        
        contentV.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imgV.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.centerY.equalTo(contentV)
            make.height.width.equalTo(50)
        }
        
        coffeeName.snp.makeConstraints { make in
            make.top.equalTo(imgV.snp.top)
            make.left.equalTo(imgV.snp.right).offset(6)
        }
        
        coffeeSubName.snp.makeConstraints { make in
            make.top.equalTo(coffeeName.snp.bottom).offset(3)
            make.left.equalTo(imgV.snp.right).offset(6)
        }
        
        editBtn.snp.makeConstraints { make in
            make.top.equalTo(coffeeName.snp.top)
            make.right.equalTo(-20)
        }
    }
}
