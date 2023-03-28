//
//  HomeCollectionDetailTableCell.swift
//  Coffee Now
//
//  Created by ericzero on 3/28/23.
//

import UIKit

class HomeCollectionDetailTableCell: UITableViewCell {
    
    lazy var contentV: UIView = {
        let contentV = UIView()
        contentV.backgroundColor = .clear
        return contentV
    }()
    
    lazy var contentImg: UIImageView = {
        let contentImg = UIImageView()
        contentImg.contentMode = .scaleToFill
        contentImg.image = UIImage(named: "detailCoffee")
        return contentImg
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setElements(){
        contentView.addSubview(contentV)
        contentV.addSubview(contentImg)
        
        contentV.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentImg.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(300)
        }
    }
    
}
