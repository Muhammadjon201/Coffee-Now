//
//  InstructionTableViewCell.swift
//  Coffee Now
//
//  Created by ericzero on 3/29/23.
//

import UIKit
import SnapKit

protocol InstructionTableViewCellDelegate: AnyObject {
    func addBasketTapped()
}

class InstructionTableViewCell: UITableViewCell {
        
    weak var delegate: InstructionTableViewCellDelegate?
    
    var addBasketTap: ((Bool) -> Void)?

    
    lazy var contentV: UIView = {
        let contentV = UIView()
        contentV.backgroundColor = .clear
        return contentV
    }()
    
    lazy var instructionLabel: UILabel = {
        let instructionLabel = UILabel()
        instructionLabel.numberOfLines = 1
        instructionLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        instructionLabel.text = "Special Instructions"
        return instructionLabel
    }()

    lazy var optionalLabel: UILabel = {
        let optionalLabel = UILabel()
        optionalLabel.numberOfLines = 1
        optionalLabel.font = .systemFont(ofSize: 10)
        optionalLabel.text = "Optional"
        optionalLabel.textColor = .systemGray3
        return optionalLabel
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.clipsToBounds = true
        textView.layer.cornerRadius = 6
        textView.backgroundColor = .systemGray5
        textView.layer.borderWidth = 0.1
        textView.layer.borderColor = UIColor.black.cgColor
        textView.textContainerInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        textView.text = "E.g No onions, please"
        textView.textAlignment = .left
        textView.textColor = .systemGray2
        return textView
    }()
    
    lazy var minusButton: UIButton = {
        let minusButton = UIButton()
        minusButton.setImage(UIImage(systemName: "minus"), for: .normal)
        minusButton.tintColor = .orange
        minusButton.backgroundColor = .white
        minusButton.layer.cornerRadius = 8
        minusButton.layer.shadowColor = UIColor.black.cgColor
        minusButton.layer.shadowOpacity = 0.5
        minusButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        minusButton.layer.shadowRadius = 4
        minusButton.addTarget(self, action: #selector(minusTapped), for: .touchUpInside)
        return minusButton
    }()
    
    lazy var plusButton: UIButton = {
        let plusButton = UIButton()
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.tintColor = .orange
        plusButton.backgroundColor = .white
        plusButton.layer.cornerRadius = 8
        plusButton.layer.shadowColor = UIColor.black.cgColor
        plusButton.layer.shadowOpacity = 0.5
        plusButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        plusButton.layer.shadowRadius = 4 
        plusButton.addTarget(self, action: #selector(plusTapped), for: .touchUpInside)
        return plusButton
    }()
    
    lazy var countLabel: UILabel = {
        let countLabel = UILabel()
        countLabel.numberOfLines = 1
        countLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        countLabel.text = "\(count)"
        return countLabel
    }()
    
    lazy var addBasketBtn: UIButton = {
        let addBasketBtn = UIButton()
        addBasketBtn.setTitle("Add to Basket", for: .normal)
        addBasketBtn.backgroundColor = .brown
        addBasketBtn.clipsToBounds = true
        addBasketBtn.layer.cornerRadius = 10
        addBasketBtn.addTarget(self, action: #selector(addBasketTapped), for: .touchUpInside)
        return addBasketBtn
    }()
    
    // MARK: - Actions
    var count = 1
    
    @objc func plusTapped(){
        count += 1
        countLabel.text = "\(count)"
    }
    
    @objc func minusTapped(){
        if count > 1 {
            count -= 1
            countLabel.text = "\(count)"
        }
        
    }
    
    @objc func addBasketTapped(){
        //delegate?.addBasketTapped()
        if let pressed = self.addBasketTap {
            pressed(true)
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setElements(){
        contentView.addSubview(contentV)
        contentV.addSubview(instructionLabel)
        contentV.addSubview(optionalLabel)
        contentV.addSubview(textView)
        contentV.addSubview(minusButton)
        contentV.addSubview(countLabel)
        contentV.addSubview(plusButton)
        contentV.addSubview(addBasketBtn)
        
        contentV.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        instructionLabel.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.left.equalTo(20)
        }
        
        optionalLabel.snp.makeConstraints { make in
            make.centerY.equalTo(instructionLabel)
            make.left.equalTo(instructionLabel.snp.right).offset(6)
        }
        
        textView.snp.makeConstraints { make in
            make.top.equalTo(instructionLabel.snp.bottom).offset(10)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(61)
        }
        
        minusButton.snp.makeConstraints { make in
            make.top.equalTo(textView.snp.bottom).offset(28)
            make.left.equalTo(120)
            make.height.width.equalTo(36)
        }
        
        countLabel.snp.makeConstraints { make in
            make.centerY.equalTo(minusButton)
            make.centerX.equalToSuperview()
        }
        
        plusButton.snp.makeConstraints { make in
            make.top.equalTo(textView.snp.bottom).offset(28)
            make.right.equalTo(-119)
            make.height.width.equalTo(36)
        }
        
        addBasketBtn.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(54)
            make.bottom.equalTo(-40)
        }
    }
}
