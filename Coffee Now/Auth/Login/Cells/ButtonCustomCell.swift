//
//  ButtonCustomCell.swift
//  Coffee Now
//
//  Created by ericzero on 3/17/23.
//

import UIKit

class ButtonCustomCell: UITableViewCell {

    var mainView = UIView()
    
    var actionBtn = UIButton(type: .system)
    
    var skipAccountLabel = UILabel()
    
    var registerBtn = UIButton()
  
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
        
        skipAccountLabel.frame = CGRect(x: 20, y: actionBtn.frame.maxY + 13, width: mainView.frame.width, height: 21)
        skipAccountLabel.numberOfLines = 0
        skipAccountLabel.textAlignment = .left
        skipAccountLabel.text = "\(type.registerSkipLabel)"
        skipAccountLabel.textColor = .systemGray
        mainView.addSubview(skipAccountLabel)
        
        registerBtn.frame = CGRect(x: skipAccountLabel.frame.maxY, y: actionBtn.frame.maxY + 13, width: mainView.frame.width, height: 21)
        registerBtn.setTitle("Register", for: .normal)
        registerBtn.setTitleColor(UIColor.orange, for: .normal)
        mainView.addSubview(registerBtn)
    }
    
    // These are Login, register buttons to enter HomeVC..
    @objc func actionBtnTapped(){
        print("bosildi")
        
    }
    
}
