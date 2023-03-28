//
//  TransactionsVC.swift
//  Coffee Now
//
//  Created by ericzero on 3/20/23.
//

import UIKit

class TransactionsVC: UIViewController {
    
    lazy var tableview: UITableView = {
        let tableview = UITableView()
        
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        navigationBarSetUp()
        self.navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    func tableViewSetup(){
        view.backgroundColor = .clear
        self.navigationItem.title = "Transactions"
        self.view.addSubview(tableview)
        tableview.separatorStyle = .none
        tableview.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(10)
            make.right.equalTo(-10)
        }
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(TransactionTableViewCell.self, forCellReuseIdentifier: "TransactionTableViewCell")
    }
    
    func navigationBarSetUp(){
        let leftArrow = UIImage(systemName: "arrow.left")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: leftArrow, style: .plain, target: self, action: #selector(leftArrowTapped))
    }
    
    @objc func leftArrowTapped(){
        print("ArrowTaps")
    }
    
    var transactionInfo = [
        TransactionsData(contentImg: UIImage(named: "coffeeshop1"), nameLabel: "Starbucks - CSB Mall", orderLbl: "Reorder", itemsLbl: "2 Items", dateLbl: "23 march, 2023"),
        TransactionsData(contentImg: UIImage(named: "coffeeshop2"), nameLabel: "KFC Coffee - Kartini Street", orderLbl: "Reorder", itemsLbl: "3 Items", dateLbl: "22 march, 2023"),
        TransactionsData(contentImg: UIImage(named: "coffeeshop3"), nameLabel: "Semasa Coffee", orderLbl: "Reorder", itemsLbl: "5 Items", dateLbl: "20 march, 2023")
    ]
}

extension TransactionsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTableViewCell", for: indexPath) as! TransactionTableViewCell
        cell.updateCell(data: transactionInfo[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
