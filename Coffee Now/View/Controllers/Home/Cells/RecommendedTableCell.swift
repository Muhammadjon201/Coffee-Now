//
//  RecommendedHomeCell.swift
//  Coffee Now
//
//  Created by ericzero on 3/22/23.
//

import UIKit

class RecommendedTableCell: UITableViewCell {
    
    lazy var collectionV: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionV = UICollectionView(frame: CGRect(x: 20, y: 0, width: windowWidth - 40, height: 220), collectionViewLayout: layout)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        collectionV.showsHorizontalScrollIndicator = false
        collectionV.collectionViewLayout = layout

        return collectionV
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setCollection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCollection(){
        collectionV.delegate = self
        collectionV.dataSource = self
        collectionV.register(RecommendedCollectionCell.self, forCellWithReuseIdentifier: "RecommendedCollectionCell")
        self.contentView.addSubview(collectionV)
        collectionV.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    var recommendedData = [
        RecommendedCollectionViewData(contentImg: UIImage(named: "coffee"), contentIcon: UIImage(named: "love"), contentLabel: "Macchiato Short", coffeePrice: "$5.00", basketImage: UIImage(named: "basket")),
        RecommendedCollectionViewData(contentImg: UIImage(named: "coffee2"), contentIcon: UIImage(named: "love"), contentLabel: "Macchiato Short", coffeePrice: "$5.00", basketImage: UIImage(named: "basket")),
        RecommendedCollectionViewData(contentImg: UIImage(named: "coffee2"), contentIcon: UIImage(named: "love"), contentLabel: "Macchiato Short", coffeePrice: "$5.00", basketImage: UIImage(named: "basket")),
        RecommendedCollectionViewData(contentImg: UIImage(named: "coffee"), contentIcon: UIImage(named: "love"), contentLabel: "Macchiato Short", coffeePrice: "$5.00", basketImage: UIImage(named: "basket")),
        RecommendedCollectionViewData(contentImg: UIImage(named: "coffee2"), contentIcon: UIImage(named: "love"), contentLabel: "Macchiato Short", coffeePrice: "$5.00", basketImage: UIImage(named: "basket"))
    ]
}

extension RecommendedTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendedData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedCollectionCell", for: indexPath) as! RecommendedCollectionCell
        cell.updateCell(data: recommendedData[indexPath.row])

        cell.isUserInteractionEnabled = true
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 10
        cell.backgroundColor = .clear
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.frame.width / 2) - 30
        return CGSize(width: width, height: 220)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
