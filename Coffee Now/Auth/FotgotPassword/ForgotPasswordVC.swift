//
//  ForgotPasswordVC.swift
//  Coffee Now
//
//  Created by ericzero on 3/17/23.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    var mainView = UIView()
    var headerView = HeaderLogoView()
    var tableView = UITableView()
    var sentLinkLabel = UILabel()
    
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
        headerView.setupViews(frame: CGRect(x: 20, y: 0, width: windowWidth - 40, height: 150), mode: .forgotPassword)
        mainView.addSubview(headerView)
        sentLinkLabel.text = "We’ll send a password reset link to your email"
        sentLinkLabel.font = .systemFont(ofSize: 14, weight: .regular)
        sentLinkLabel.numberOfLines = 2
        sentLinkLabel.textAlignment = .center
        sentLinkLabel.textColor = .systemGray2
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
        mainView.addSubview(sentLinkLabel)
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
        
        sentLinkLabel.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(6)
            make.left.equalTo(89)
            make.right.equalTo(-89)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(sentLinkLabel.snp.bottom).offset(10)
            make.left.right.bottom.equalTo(mainView)
        }
    }
}

extension ForgotPasswordVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditableTableViewCell", for: indexPath) as! EditableTableViewCell
            cell.initViews(frame: CGRect(x: 20, y: 0, width: windowWidth - 40, height: 80), type: .email)
            cell.backgroundColor = .blue
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCustomCell", for: indexPath) as! ButtonCustomCell
            cell.initViews(frame: CGRect(x: 20, y: 0 , width: windowWidth - 40, height: 80), type: .forgotPassword)
            cell.backgroundColor = .green
            cell.selectionStyle = .none
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
