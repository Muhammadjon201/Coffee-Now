//
//  HomeVC.swift
//  Coffee Now
//
//  Created by ericzero on 3/20/23.
//

import UIKit
import SnapKit

class HomeVC: UIViewController {

    var headerView = UIView()
    var nameLabel = UILabel()
    var locationIcon = UIImageView()
    var locationLabel = UILabel()
    var ticketIcon = UIImageView()
    var heartIcon = UIImageView()
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        initViews()
        setTableView()
    }
    
    func initViews(){
        self.view.addSubview(headerView)
        headerView.backgroundColor = .clear
        headerView.snp.makeConstraints { make in
            make.top.equalTo(60)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(70)
        }
        
        nameLabel.text = "Hello, John!"
        nameLabel.font = .systemFont(ofSize: 18, weight: .medium)
        headerView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.left.equalTo(0)
        }
        
        locationIcon.image = UIImage(named: "location")
        headerView.addSubview(locationIcon)
        locationIcon.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.left.equalTo(0)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        locationLabel.text = "JAKARTA, INDONESIA"
        locationLabel.numberOfLines = 1
        locationLabel.textColor = .orange
        locationLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        headerView.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(13)
            make.left.equalTo(locationIcon.snp.right).offset(2)
        }
        
        heartIcon.image = UIImage(named: "heart")
        heartIcon.contentMode = .scaleAspectFit
        headerView.addSubview(heartIcon)
        heartIcon.snp.makeConstraints { make in
            make.centerY.equalTo(headerView.snp.centerY)
            make.right.equalToSuperview()
            make.width.equalTo(28)
            make.height.equalTo(28)
        }
        
        ticketIcon.image = UIImage(named: "ticket")
        ticketIcon.contentMode = .scaleAspectFit
        headerView.addSubview(ticketIcon)
        ticketIcon.snp.makeConstraints { make in
            make.centerY.equalTo(headerView.snp.centerY)
            make.right.equalTo(heartIcon.snp.left).offset(-10)
            make.width.equalTo(28)
            make.height.equalTo(28)
        }
    }
    
    func setTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
        tableView.register(RecommendedTableCell.self, forCellReuseIdentifier: "RecommendedHomeCell")
        tableView.register(PopularBrandTableCell.self, forCellReuseIdentifier: "PopularBrandTableCell")
        tableView.register(CoffeeShopTableViewCell.self, forCellReuseIdentifier: "CoffeeShopTableViewCell")
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(0)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottom.equalToSuperview()
        }
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
            cell.backgroundColor = .clear
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendedHomeCell", for: indexPath) as! RecommendedTableCell
            cell.backgroundColor = .clear
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PopularBrandTableCell", for: indexPath) as! PopularBrandTableCell
            cell.backgroundColor = .clear
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeShopTableViewCell", for: indexPath) as! CoffeeShopTableViewCell
            cell.backgroundColor = .clear
            return cell
        default:
            let cell = UITableViewCell()
            cell.backgroundColor = .systemGray4
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 1:
            let view = UIView()
            view.frame = CGRect(x: 20, y: 10, width: windowWidth - 40, height: 30)
            let titleLabel = UILabel()
            titleLabel.frame = CGRect(x: 0, y: (view.frame.height - 10)/2, width: view.frame.width, height: 20)
            titleLabel.text = "RECOMMENDED FOR YOU"
            view.addSubview(titleLabel)
            view.backgroundColor = .clear
            return view
        case 2:
            let view = UIView()
            view.frame = CGRect(x: 20, y: 10, width: windowWidth - 40, height: 30)
            let titleLabel = UILabel()
            titleLabel.frame = CGRect(x: 0, y: (view.frame.height - 10)/2, width: view.frame.width, height: 20)
            titleLabel.text = "POPULAR BRAND"
            view.addSubview(titleLabel)
            view.backgroundColor = .clear
            return view
        default:
            let view = UIView()
            view.frame = CGRect(x: 20, y: 10, width: windowWidth - 40, height: 30)
            let titleLabel = UILabel()
            titleLabel.frame = CGRect(x: 0, y: (view.frame.height - 10)/2, width: view.frame.width, height: 20)
            titleLabel.text = "COFFEE SHOP"
            view.addSubview(titleLabel)
            view.backgroundColor = .clear
            return view
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        case 1:
            return 30
        case 2:
            return 30
        case 3:
            return 30
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 170
        case 1:
            return 250
        case 2:
            return 170
        default:
            return 170
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = HomeCollectionDetailVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
