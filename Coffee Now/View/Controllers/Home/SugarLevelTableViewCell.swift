//
//  SugarLevelTableViewCell.swift
//  Coffee Now
//
//  Created by ericzero on 3/29/23.
//

import UIKit

class SugarLevelTableViewCell: UITableViewCell {
    
    lazy var contentV: UIView = {
        let contentV = UIView()
        contentV.backgroundColor = .clear
        return contentV
    }()
    
    lazy var sugarLevel: UILabel = {
        let sugarLevel = UILabel()
        sugarLevel.numberOfLines = 1
        sugarLevel.font = .systemFont(ofSize: 14, weight: .semibold)
        
        sugarLevel.text = "Sugar Level"
        return sugarLevel
    }()
    
    lazy var normalLabel: UILabel = {
        let normalLabel = UILabel()
        normalLabel.numberOfLines = 1
        normalLabel.font = .systemFont(ofSize: 12)
        normalLabel.text = "Normal"
        return normalLabel
    }()
    
    lazy var lessSugarLabel: UILabel = {
        let lessSugarLabel = UILabel()
        lessSugarLabel.numberOfLines = 1
        lessSugarLabel.font = .systemFont(ofSize: 12)
        lessSugarLabel.text = "Less Sugar"
        return lessSugarLabel
    }()
    
    lazy var normalEllipse: UIButton = {
        let normalEllipse = UIButton()
        let normalImg = UIImage(named: "ellipse")?.withRenderingMode(.alwaysTemplate)
        normalEllipse.contentMode = .scaleToFill
        normalEllipse.setImage(normalImg, for: .normal)
        normalEllipse.addTarget(self, action: #selector(normalTapped), for: .touchUpInside)
        normalEllipse.tintColor = UIColor.gray
        return normalEllipse
    }()
    
    lazy var lessEllipse: UIButton = {
        let lessEllipse = UIButton()
        let lessImg = UIImage(named: "ellipse")?.withRenderingMode(.alwaysTemplate)
        lessEllipse.contentMode = .scaleToFill
        lessEllipse.setImage(lessImg, for: .normal)
        lessEllipse.addTarget(self, action: #selector(lessTapped), for: .touchUpInside)
        lessEllipse.tintColor = UIColor.gray
        return lessEllipse
    }()
    
    // MARK: - Actions
    
    @objc func lessTapped(){
          lessEllipse.tintColor = UIColor.orange
          normalEllipse.tintColor = UIColor.gray
    }
    
    @objc func normalTapped(){
          normalEllipse.tintColor = UIColor.orange
          lessEllipse.tintColor = .gray
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
        contentV.addSubview(sugarLevel)
        contentV.addSubview(normalLabel)
        contentV.addSubview(lessSugarLabel)
        contentV.addSubview(lessEllipse)
        contentV.addSubview(normalEllipse)
        contentV.addSubview(lessEllipse)
        
        contentV.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        sugarLevel.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.left.equalTo(20)
        }
        
        normalLabel.snp.makeConstraints { make in
            make.top.equalTo(sugarLevel.snp.bottom).offset(10)
            make.left.equalTo(20)
        }

        lessSugarLabel.snp.makeConstraints { make in
            make.top.equalTo(normalLabel.snp.bottom).offset(12)
            make.left.equalTo(20)
        }
        
        normalEllipse.snp.makeConstraints { make in
            make.centerY.equalTo(normalLabel)
            make.right.equalTo(-26)
            make.height.width.equalTo(16)
        }
        
        lessEllipse.snp.makeConstraints { make in
            make.centerY.equalTo(lessSugarLabel)
            make.right.equalTo(-26)
            make.height.width.equalTo(16)
        }
    }
}
