//
//  CoffeeShopTableViewCell.swift
//  Coffee Now
//
//  Created by ericzero on 3/23/23.
//

import UIKit

class CoffeeShopTableViewCell: UITableViewCell {

    lazy var collectionV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionV = UICollectionView(frame: CGRect(x: 0, y: 0, width: windowWidth, height: 88), collectionViewLayout: layout)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
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
        collectionV.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.left.right.bottom.equalToSuperview()
        }
        
        collectionV.dataSource = self
        collectionV.delegate = self
        collectionV.register(CoffeeShopCollectionCell.self, forCellWithReuseIdentifier: "CoffeeShopCollectionCell")
    }
    
    var coffeeShopData = [
        CoffeeShop(contentImg: UIImage(named: "coffeeshop1"), nameLabel: "Starbucks - CSB Mall", orderLbl: "Order Now"),
        CoffeeShop(contentImg: UIImage(named: "coffeeshop2"), nameLabel: "KFC Coffee - Kartini Street", orderLbl: "Order Now"),
        CoffeeShop(contentImg: UIImage(named: "coffeeshop3"), nameLabel: "Semasa Coffee", orderLbl: "Order Now")
    ]
}

extension CoffeeShopTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coffeeShopData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoffeeShopCollectionCell", for: indexPath) as! CoffeeShopCollectionCell
        cell.updateCell(data: coffeeShopData[indexPath.row])
        cell.backgroundColor = .clear
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 88)
    }
}
