//
//  LoginFooterViewCell.swift
//  Coffee Now
//
//  Created by ericzero on 3/21/23.
//

import UIKit
import SnapKit

class LoginFooterViewCell: UITableViewCell {
    
    var mainView = UIView()
    var leftLine = UIView()
    var rightLine = UIView()
    var orLabel = UILabel()
    var googleBtn = UIButton()
    var facebookBtn = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews(){
        self.addSubview(mainView)
        mainView.backgroundColor = .clear
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        leftLine.backgroundColor = .systemGray
        mainView.addSubview(leftLine)
        leftLine.snp.makeConstraints { make in
            make.top.equalTo(40)
            make.left.equalTo(20)
            make.width.equalTo(135)
            make.height.equalTo(1)
        }
        
        orLabel.text = "OR"
        orLabel.font = .systemFont(ofSize: 18, weight: .bold)
        orLabel.textColor = .systemGray
        orLabel.textAlignment = .center
        orLabel.numberOfLines = 1
        mainView.addSubview(orLabel)
        orLabel.snp.makeConstraints { make in
            make.top.equalTo(40)
            make.left.equalTo(leftLine.snp.right).offset(20)
        }
        
        rightLine.backgroundColor = .systemGray
        mainView.addSubview(rightLine)
        rightLine.snp.makeConstraints { make in
            make.top.equalTo(40)
            make.right.equalTo(-20)
            make.left.equalTo(orLabel.snp.right).offset(20)
            make.width.equalTo(135)
            make.height.equalTo(1)
        }
        
        googleBtn.setImage(UIImage(named: "Google"), for: .normal)
        googleBtn.clipsToBounds = true
        googleBtn.layer.cornerRadius = 20
        googleBtn.imageView?.contentMode = .scaleAspectFit
        googleBtn.layer.shadowColor = UIColor.darkGray.cgColor
        googleBtn.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        googleBtn.layer.shadowOpacity = 0.4
        googleBtn.layer.shadowRadius = 5.0
        googleBtn.addTarget(self, action: #selector(googleBtnTapped), for: .touchUpInside)
        mainView.addSubview(googleBtn)
        googleBtn.snp.makeConstraints { make in
            make.top.equalTo(leftLine.snp.bottom).offset(46)
            make.left.equalTo(81)
            make.width.height.equalTo(100)
        }
        
        facebookBtn.setImage(UIImage(named: "Facebook"), for: .normal)
        facebookBtn.clipsToBounds = true
        facebookBtn.layer.cornerRadius = 20
        facebookBtn.imageView?.contentMode = .scaleAspectFit
        facebookBtn.layer.shadowColor = UIColor.darkGray.cgColor
        facebookBtn.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        facebookBtn.layer.shadowOpacity = 0.4
        facebookBtn.layer.shadowRadius = 5.0
        facebookBtn.addTarget(self, action: #selector(facebookBtnTapped), for: .touchUpInside)
        mainView.addSubview(facebookBtn)
        facebookBtn.snp.makeConstraints { make in
            make.top.equalTo(rightLine.snp.bottom).offset(46)
            make.right.equalTo(-81)
            make.width.height.equalTo(100)
        }
    }
    
    // MARK: - Login Button Actions.
    
    @objc func googleBtnTapped(){
        print("Google Button Tapped")
    }
    
    @objc func facebookBtnTapped(){
        print("Facebook Button Tapped")
    }
}
