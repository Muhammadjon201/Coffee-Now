//
//  CheckoutViewController.swift
//  Coffee Now
//
//  Created by ericzero on 3/30/23.
//

import UIKit
import SnapKit

class CheckoutViewController: UIViewController {
        
    lazy var bottomView: UIView = {
        let bottomView = UIView()
        bottomView.backgroundColor = .brown
        bottomView.clipsToBounds = true
        bottomView.layer.cornerRadius = 12
        return bottomView
    }()
    
    //let countLabel = UILabel()
    
    var itemCountLabel: String = ""
    var countlabel = UILabel()
//
//    lazy var itemCountLabel: UILabel = {
//        let itemCountLabel = UILabel()
//        itemCountLabel.numberOfLines = 1
//        itemCountLabel.font = .systemFont(ofSize: 14, weight: .semibold)
//        itemCountLabel.text = "1"
//        itemCountLabel.textColor = .white
//        itemCountLabel.textAlignment = .center
//        itemCountLabel.clipsToBounds = true
//        itemCountLabel.layer.cornerRadius = 16
//        itemCountLabel.backgroundColor = .gray
//        return itemCountLabel
//    }()
    
    lazy var itemPriceLabel: UILabel = {
        let itemPriceLabel = UILabel()
        itemPriceLabel.numberOfLines = 1
        itemPriceLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        itemPriceLabel.text = "$10.00"
        itemPriceLabel.textAlignment = .center
        itemPriceLabel.textColor = .white
        itemPriceLabel.clipsToBounds = true
        itemPriceLabel.layer.cornerRadius = 5
        itemPriceLabel.backgroundColor = .gray
        return itemPriceLabel
    }()
    
    lazy var goCheckoutBtn: UIButton = {
        let goCheckoutBtn = UIButton()
        goCheckoutBtn.tintColor = .white
        goCheckoutBtn.setTitle("Go to Checkout", for: .normal)
        goCheckoutBtn.titleLabel?.contentMode = .center
        goCheckoutBtn.addTarget(self, action: #selector(goCheckoutBtnTapped), for: .touchUpInside)
        return goCheckoutBtn
    }()
    
    lazy var tableV: UITableView = {
        let tableV = UITableView()
        tableV.backgroundColor = .clear
        return tableV
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setElements()
        self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.backBarButtonItem?.tintColor = .black
        countlabel.text = itemCountLabel
        countlabel.numberOfLines = 1
        countlabel.font = .systemFont(ofSize: 14, weight: .semibold)
        countlabel.textColor = .green
        countlabel.textAlignment = .center
        countlabel.clipsToBounds = true
        countlabel.layer.cornerRadius = 16
        countlabel.backgroundColor = .gray
    }
    
    @objc func goCheckoutBtnTapped(){
        print("worked")
    }
    
    func setTableView(){
        tableV.delegate = self
        tableV.dataSource = self
        tableV.register(CheckoutTableViewCell.self, forCellReuseIdentifier: "CheckoutTableViewCell")
    }
    
    func setElements(){
        self.view.backgroundColor = .white
        self.navigationItem.title = "My Basket"
        
        view.addSubview(tableV)
        view.addSubview(bottomView)
        bottomView.addSubview(countlabel)
        bottomView.addSubview(goCheckoutBtn)
        bottomView.addSubview(itemPriceLabel)
        
        tableV.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(0)
            make.left.right.bottom.equalToSuperview()
        }
        
        bottomView.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-27)
            make.bottom.equalToSuperview().offset(-27)
            make.height.equalTo(67)
        }
        
        countlabel.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.centerY.equalTo(bottomView)
            make.height.width.equalTo(31)
        }
        
        itemPriceLabel.snp.makeConstraints { make in
            make.right.equalTo(-16)
            make.centerY.equalTo(bottomView)
            make.height.equalTo(31)
            make.width.equalTo(60)
        }
        
        goCheckoutBtn.snp.makeConstraints { make in
            make.edges.equalTo(bottomView)
        }
    }
}

extension CheckoutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutTableViewCell", for: indexPath) as! CheckoutTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
