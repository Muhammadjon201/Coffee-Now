//
//  HomeCollectionDetailVC.swift
//  Coffee Now
//
//  Created by ericzero on 3/25/23.
//

import UIKit
import SnapKit

class HomeCollectionDetailVC: UIViewController, InstructionTableViewCellDelegate {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        view.backgroundColor = .white
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .black
        
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setUpElements(){
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(HomeCollectionDetailTableCell.self, forCellReuseIdentifier: "HomeCollectionDetailTableCell")
        tableView.register(HomeDetailNameTableCell.self, forCellReuseIdentifier: "HomeDetailNameTableCell")
        tableView.register(SugarLevelTableViewCell.self, forCellReuseIdentifier: "SugarLevelTableViewCell")
        tableView.register(InstructionTableViewCell.self, forCellReuseIdentifier: "InstructionTableViewCell")
    }
}

extension HomeCollectionDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCollectionDetailTableCell", for: indexPath) as! HomeCollectionDetailTableCell
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeDetailNameTableCell", for: indexPath) as! HomeDetailNameTableCell
            cell.backgroundColor = .white
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SugarLevelTableViewCell", for: indexPath) as! SugarLevelTableViewCell
            
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InstructionTableViewCell", for: indexPath) as! InstructionTableViewCell
            cell.delegate = self
            cell.addBasketTap = { press in
                print("add basket ishlb ketdi")
                let vc = CheckoutViewController()
                vc.countlabel = cell.countLabel
                self.navigationController?.pushViewController(vc, animated: true)
            }
            return cell
        default:
            let cell = UITableViewCell()
            cell.backgroundColor = .white
            return cell
        }
    }
    
    //MARK: - Action Button Delegate
    
    func addBasketTapped() {
         let vc = CheckoutViewController()
         self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 300
        case 1:
            return 70
        case 2:
            return 100
        default:
            return 280
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
