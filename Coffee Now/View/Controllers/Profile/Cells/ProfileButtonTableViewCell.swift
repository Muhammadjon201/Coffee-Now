//
//  ProfileButtonTableViewCell.swift
//  Coffee Now
//
//  Created by ericzero on 3/24/23.
//

import UIKit

class ProfileButtonTableViewCell: UITableViewCell {
    
    lazy var logoutBtn: UIButton = {
        let logoutBtn = UIButton()
        logoutBtn.setTitle("Logout", for: .normal)
        logoutBtn.setTitleColor(UIColor.orange, for: .normal)
        logoutBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        logoutBtn.clipsToBounds = true
        logoutBtn.layer.cornerRadius = 10
        logoutBtn.backgroundColor = .systemGray4
        logoutBtn.addTarget(self, action: #selector(logoutBtnTapped), for: .touchUpInside)
        return logoutBtn
    }()
    
    @objc func logoutBtnTapped(){
        print("log")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpElements(){
        self.contentView.addSubview(logoutBtn)
        logoutBtn.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.centerY.equalTo(contentView)
            make.height.equalTo(48)
        }
    }
}
