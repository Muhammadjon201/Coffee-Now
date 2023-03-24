//
//  PopularBrandTableCell.swift
//  Coffee Now
//
//  Created by ericzero on 3/23/23.
//

import UIKit

class PopularBrandTableCell: UITableViewCell {
    
    lazy var collectionV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionV = UICollectionView(frame: CGRect(x: 20, y: 0, width: windowWidth - 40, height: 100), collectionViewLayout: layout)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        collectionV.showsHorizontalScrollIndicator = false
        collectionV.backgroundColor = .clear
        collectionV.collectionViewLayout = layout
        return collectionV
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setCollectionV()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCollectionV(){
        self.contentView.addSubview(collectionV)
        collectionV.delegate = self
        collectionV.dataSource = self
        collectionV.register(PopularBrandCollectionCell.self, forCellWithReuseIdentifier: "PopularBrandCollectionCell")
        collectionV.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    var brandData = [
        BrandImage(brandNameImage: UIImage(named: "starbucks")),
        BrandImage(brandNameImage: UIImage(named: "ediya")),
        BrandImage(brandNameImage: UIImage(named: "darihati")),
        BrandImage(brandNameImage: UIImage(named: "tomntoms")),
        BrandImage(brandNameImage: UIImage(named: "starbucks")),
        BrandImage(brandNameImage: UIImage(named: "ediya")),
        BrandImage(brandNameImage: UIImage(named: "darihati")),
        BrandImage(brandNameImage: UIImage(named: "tomntoms"))
    ]
}

extension PopularBrandTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brandData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularBrandCollectionCell", for: indexPath) as! PopularBrandCollectionCell
        cell.updateCell(data: brandData[indexPath.row])
        cell.clipsToBounds = true
        cell.contentMode = .scaleAspectFill
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 3) - 40 , height: 100)
    }
}


