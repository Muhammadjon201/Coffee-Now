//
//  RegisterVC.swift
//  Coffee Now
//
//  Created by ericzero on 3/17/23.
//

import UIKit

class RegisterVC: UIViewController, ButtonCustomCellDelegate {
    func bottomRegister() {
        print("boshqa oynadagi button")
    }
    
    func bottomLogin() {
        //
    }
    
    func addAddressBtn() {
        //
    }
    
    func loginBtnTapped() {
        //
    }
    
    func registerBtnTapped() {
        let vc = AddressSetupVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    

    var mainView = UIView()
    var headerView = HeaderLogoView()
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        configureTableView()
        initContaint()
    }
    
    func initViews() {
        view.backgroundColor = .white
        mainView.backgroundColor = .clear
        self.view.addSubview(mainView)
        headerView.setupViews(frame: CGRect(x: 20, y: 0, width: windowWidth - 40, height: 150), mode: .register)
        mainView.addSubview(headerView)
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.register(EditableTableViewCell.self, forCellReuseIdentifier: "EditableTableViewCell")
        tableView.register(ButtonCustomCell.self, forCellReuseIdentifier: "ButtonCustomCell")
        tableView.separatorStyle = .none
        tableView.isUserInteractionEnabled = true
        mainView.addSubview(tableView)
    }

    func initContaint() {

        mainView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(windowStatusBarHeight)
        }

        headerView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(150)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.left.right.bottom.equalTo(mainView)
        }
    }
}

extension RegisterVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditableTableViewCell", for: indexPath) as! EditableTableViewCell
            cell.initViews(frame: CGRect(x: 20, y: 0, width: windowWidth - 40, height: 80), type: .fullname)
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
        
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditableTableViewCell", for: indexPath) as! EditableTableViewCell
            cell.initViews(frame: CGRect(x: 20, y: 0, width: windowWidth - 40, height: 80), type: .email)
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
        
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditableTableViewCell", for: indexPath) as! EditableTableViewCell
            cell.initViews(frame: CGRect(x: 20, y: 0, width: windowWidth - 40, height: 80), type: .phoneNumber)
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
        
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditableTableViewCell", for: indexPath) as! EditableTableViewCell
            cell.initViews(frame: CGRect(x: 20, y: 0, width: windowWidth - 40, height: 80), type: .password)
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
        
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCustomCell", for: indexPath) as! ButtonCustomCell
            cell.initViews(frame: CGRect(x: 20, y: 0, width: windowWidth - 40, height: 80), type: .register)
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            cell.delegate = self    
            return cell
        default:
            let cell = UITableViewCell()
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
}
