//
//  HeaderLogoView.swift
//  Coffee Now
//
//  Created by Nuriddin Jumayev on 14/03/23.
//

import UIKit
import SnapKit

class HeaderLogoView: UIView {
    
    var mainView = UIView()
    var containerView = UIView()
    var titleLabel = UILabel()
    var iconImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews(frame: frame, mode: .login)
//        self.initConstraints()
        }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(frame: CGRect, mode: LoginHeaferType){
        
        mainView.frame = frame
        mainView.backgroundColor = .clear
        self.addSubview(mainView)
        
        iconImage.frame = CGRect(x: (mainView.frame.width - 88) / 2, y: 10, width: 88, height: 88)
        iconImage.image = UIImage(named: "iconImg")
        iconImage.contentMode = .center
        mainView.addSubview(iconImage)
        
        titleLabel.frame = CGRect(x: 20, y: iconImage.frame.maxY + 16, width: mainView.frame.width - 40, height: 36)
        titleLabel.text = mode.title
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = .clear
        mainView.addSubview(titleLabel)
    }
    
}
