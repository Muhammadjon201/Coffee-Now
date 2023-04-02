//
//  LoginVC.swift
//  Coffee Now
//
//  Created by Nuriddin Jumayev on 14/03/23.
//

import UIKit
import SnapKit

class LoginVC: UIViewController, ButtonCustomCellDelegate {
    
    func bottomRegister() {
        let vc = RegisterVC()
        print("ishladi buyam")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    func bottomLogin() {
        //
    }
    
    func addAddressBtn() {
        //
    }
    
    func registerBtnTapped() {
        //
    }
    
   
    var mainView = UIView()
    var headerView = HeaderLogoView()
    var tableView = UITableView()
    
     //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.initViews()
        self.configureTableView()
        self.initContaint()
    }
    
    func initViews() {
        view.backgroundColor = .white
        mainView.backgroundColor = .clear
        self.view.addSubview(mainView)
        headerView.setupViews(frame: CGRect(x: 20, y: 0, width: windowWidth - 40, height: 150), mode: .login)
        mainView.addSubview(headerView)
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.register(EditableTableViewCell.self, forCellReuseIdentifier: "EditableTableViewCell")
        tableView.register(ButtonCustomCell.self, forCellReuseIdentifier: "ButtonCustomCell")
        tableView.register(LoginFooterViewCell.self, forCellReuseIdentifier: "LoginFooterViewCell")
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
    
    func loginBtnTapped() {
        let vc = RegisterVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
}

extension LoginVC: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditableTableViewCell", for: indexPath) as! EditableTableViewCell
            cell.initViews(frame: CGRect(x: 20, y: 0, width: windowWidth - 40, height: 80), type: .email)
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
        
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditableTableViewCell", for: indexPath) as! EditableTableViewCell
            cell.initViews(frame: CGRect(x: 20, y: 0, width: windowWidth - 40, height: 80), type: .password)
            
            cell.forgotAction = { press in
                print("segesgesgse")
            }
            
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCustomCell", for: indexPath) as! ButtonCustomCell
            cell.initViews(frame: CGRect(x: 20, y: 0, width: windowWidth - 40, height: 80), type: .login)
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            cell.delegate = self
            cell.bottomRegisterTap = { press in
                print("oxirgi harakat")
            }
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoginFooterViewCell", for: indexPath) as! LoginFooterViewCell
            cell.frame = CGRect(x: 20, y: 0, width: windowWidth - 40, height: 80)
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            return cell
        default:
            let cell = UITableViewCell()
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3 {
            return 140
        }else{
            return 108
        }
    }
}
