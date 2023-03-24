//
//  EditableTableViewCell.swift
//  Coffee Now
//
//  Created by Nuriddin Jumayev on 16/03/23.
//

import UIKit

class EditableTableViewCell: UITableViewCell {
    
    var mainView = UIView()
    
    var textfield = UITextField()
    
    var zipCodeTextF = UITextField()
    
    var titleLabel = UILabel()
    
    var forgotPassWord = UILabel()
        
    var forgotAction: ((Bool) -> Void)?
        
    func initViews(frame: CGRect, type: TextFieldInputType) {
        
        switch type {
        case .password:
            textfield.isSecureTextEntry = true
            mainView.addSubview(forgotPassWord)
            
        default:
            textfield.isSecureTextEntry = false
            forgotPassWord.removeFromSuperview()
        }
        
        mainView.frame = frame
        mainView.backgroundColor = .clear
        self.contentView.addSubview(mainView)
        
        titleLabel.frame = CGRect(x: 0, y: 0, width: windowWidth, height: 21)
        titleLabel.text = type.titleLabel
        titleLabel.textColor = .black
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 1
        titleLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        mainView.addSubview(titleLabel)
        
        textfield.frame = CGRect(x: 0, y: titleLabel.frame.maxY + 6, width: mainView.frame.width, height: 52)
        textfield.placeholder = " \(type.placeHolderLabel)"
        textfield.textColor = .black
        textfield.layer.borderColor = UIColor.systemGray.cgColor
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 10
        textfield.setLeftPaddingPoints(10)
        mainView.addSubview(textfield)
        
//        zipCodeTextF.frame = CGRect(x: 0, y: titleLabel.frame.maxY + 6, width: (mainView.frame.width - 60) / 2, height: 52)
//        zipCodeTextF.placeholder = " \(type.placeHolderLabel)"
//        zipCodeTextF.textColor = .black
//        zipCodeTextF.layer.borderColor = UIColor.systemGray.cgColor
//        zipCodeTextF.layer.borderWidth = 1
//        zipCodeTextF.layer.cornerRadius = 10
//        zipCodeTextF.setLeftPaddingPoints(10)
//        mainView.addSubview(zipCodeTextF)

        forgotPassWord.frame = CGRect(x: 0, y: textfield.frame.maxY + 9, width: mainView.frame.width, height: 16)
        forgotPassWord.text = "Forgot Password ?"
        forgotPassWord.textColor = .orange
        forgotPassWord.textAlignment = .right
        forgotPassWord.numberOfLines = 1
        forgotPassWord.font = .systemFont(ofSize: 14, weight: .regular)
        
        let forgotButton = UIButton(frame: CGRect(x: forgotPassWord.frame.width / 2, y: 0, width: forgotPassWord.frame.width / 2, height: forgotPassWord.frame.height))
        forgotButton.addTarget(self, action: #selector(forgotPressed(_: )), for: .touchUpInside)
        forgotButton.backgroundColor = .clear
        forgotPassWord.addSubview(forgotButton)
        
    }
    
    @objc func forgotPressed(_ sender: UIButton) {
        if let pressed = self.forgotAction {
            pressed(true)
        }
    }
}
