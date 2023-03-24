//
//  PopularBrandCollectionCell.swift
//  Coffee Now
//
//  Created by ericzero on 3/23/23.
//

import UIKit

class PopularBrandCollectionCell: UICollectionViewCell {
    
    lazy var contentV: UIView = {
        let contentV = UIView()
        contentV.clipsToBounds = true
        contentV.backgroundColor = .clear
        return contentV
    }()
    
    lazy var brandImage: UIImageView = {
        let brandImage = UIImageView()
        brandImage.contentMode = .scaleAspectFill
        brandImage.clipsToBounds = true
        brandImage.contentMode = .center
        return brandImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        contentView.addSubview(contentV)
        contentV.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentV.addSubview(brandImage)
        brandImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(90)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(data: BrandImage){
        brandImage.image = data.brandNameImage
    }
}
