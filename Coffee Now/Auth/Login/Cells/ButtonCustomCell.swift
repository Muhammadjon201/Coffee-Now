//
//  ButtonCustomCell.swift
//  Coffee Now
//
//  Created by ericzero on 3/17/23.
//

import UIKit

protocol ButtonCustomCellDelegate: AnyObject {
    func loginBtnTapped()
    func registerBtnTapped()
    func addAddressBtn()
    func bottomRegister()
    func bottomLogin()
}

class ButtonCustomCell: UITableViewCell {
    
    weak var delegate: ButtonCustomCellDelegate?
    
    var mainView = UIView()
    
    var actionBtn = UIButton(type: .system)
    
    var skipAccountLabel = UILabel()
    
    var registerBtn = UIButton(type: .system)
    
    var bottomRegisterTap: ((Bool) -> Void)?
  
    func initViews(frame: CGRect, type: BtnType){
        
        mainView.frame = frame
        mainView.backgroundColor = .clear
        contentView.addSubview(mainView)
        
        actionBtn.frame = CGRect(x: 0, y: 10, width: mainView.frame.width, height: 52)
        actionBtn.clipsToBounds = true
        actionBtn.layer.cornerRadius = 10
        actionBtn.setTitle("\(type.buttonTitle)", for: .normal)
        actionBtn.setTitleColor(UIColor.white, for: .normal)
        actionBtn.backgroundColor = .brown
        actionBtn.addTarget(self, action: #selector(actionBtnTapped), for: .touchUpInside)
        mainView.addSubview(actionBtn)

        skipAccountLabel.numberOfLines = 0
        skipAccountLabel.textAlignment = .left
        skipAccountLabel.text = "\(type.registerSkipLabel)"
        skipAccountLabel.textAlignment = .center
        skipAccountLabel.textColor = .systemGray
        mainView.addSubview(skipAccountLabel)
        skipAccountLabel.snp.makeConstraints { make in
            make.top.equalTo(actionBtn.snp.bottom).offset(19)
            make.left.equalTo(73)
        }
 
        registerBtn.setTitle("\(type.bottomRegisterBtn)", for: .normal)
        registerBtn.setTitleColor(UIColor.orange, for: .normal)
        registerBtn.addTarget(self, action: #selector(registerBtnTapped), for: .touchUpInside)
        mainView.addSubview(registerBtn)
        registerBtn.snp.makeConstraints { make in
            make.centerY.equalTo(skipAccountLabel)
            make.left.equalTo(skipAccountLabel.snp.right).offset(10)
        }
    }

    // These are Login, register buttons to enter HomeVC..
    @objc func actionBtnTapped(){
        delegate?.loginBtnTapped()
        delegate?.registerBtnTapped()
        delegate?.addAddressBtn()
        print("actinBtn")
    }
    
    @objc func registerBtnTapped(_ sender: UIButton){
        print("register ishladi")
        delegate?.bottomRegister()
        delegate?.bottomLogin()
        if let pressed = self.bottomRegisterTap {
            pressed(true)
        }
    }
}
