//
//  HomeTableViewCell.swift
//  Coffee Now
//
//  Created by ericzero on 3/22/23.
//

import UIKit
import SnapKit

class HomeTableViewCell: UITableViewCell {
    
    var contentV = UIView()
    var saleImage = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews(){
        self.addSubview(contentV)
        contentV.backgroundColor = .clear
        contentV.clipsToBounds = true
        contentV.layer.cornerRadius = 20
        contentV.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        saleImage.image = UIImage(named: "starbuckbanner")
        saleImage.contentMode = .scaleToFill
        contentV.addSubview(saleImage)
        saleImage.snp.makeConstraints { make in
            make.edges.equalTo(contentV)
            
        }
    }
   
}

