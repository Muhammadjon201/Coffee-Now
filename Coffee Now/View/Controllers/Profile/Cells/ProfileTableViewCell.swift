//
//  ProfileTableViewCell.swift
//  Coffee Now
//
//  Created by ericzero on 3/24/23.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    lazy var profileIcon: UIImageView = {
        let profileIcon = UIImageView()
        profileIcon.contentMode = .scaleToFill
        profileIcon.clipsToBounds = true
        return profileIcon
    }()
    
    lazy var profileLbl: UILabel = {
        let profileLbl = UILabel()
        profileLbl.numberOfLines = 1
        profileLbl.font = .systemFont(ofSize: 14, weight: .medium)
        return profileLbl
    }()
    
    lazy var profileArrow: UIImageView = {
        let profileArrow = UIImageView()
        profileArrow.contentMode = .scaleToFill
        profileArrow.clipsToBounds = true
        return profileArrow
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpElements(){
        contentView.backgroundColor = .clear
        self.contentView.addSubview(profileIcon)
        self.contentView.addSubview(profileLbl)
        self.contentView.addSubview(profileArrow)
        
        profileIcon.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalTo(contentView)
            make.width.height.equalTo(30)
        }
        
        profileLbl.snp.makeConstraints { make in
            make.left.equalTo(profileIcon.snp.right).offset(14)
            make.centerY.equalTo(contentView)
            make.right.equalTo(profileArrow.snp.left).offset(-20)
        }
        
        profileArrow.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.centerY.equalTo(contentView)
            make.width.height.equalTo(30)
        }
    }
    
    func updateCell(data: ProfileData){
        profileIcon.image = data.profileIconImg
        profileLbl.text = data.profileLabel
        profileArrow.image = data.profileArrowImg
    }
}
