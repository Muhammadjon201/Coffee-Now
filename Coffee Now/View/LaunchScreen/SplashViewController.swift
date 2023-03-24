//
//  SplashViewController.swift
//  Coffee Now
//
//  Created by ericzero on 3/14/23.
//

import UIKit
import SnapKit

class SplashViewController: UIViewController {
    
    lazy var imageView: UIImageView = {
        let splashImg = UIImageView()
        splashImg.image = UIImage(named: "Mask Group")
        return splashImg
    }()
    
    lazy var iconView: UIImageView = {
        let splashIconImg = UIImageView()
        splashIconImg.image = UIImage(named: "iconImg")
        return splashIconImg
    }()
    
    lazy var textImgView: UIImageView = {
        let splashTextImg = UIImageView()
        splashTextImg.image = UIImage(named: "textImg")
        return splashTextImg
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        timerSetup()
        setConstraints()
    }
    
    func timerSetup(){
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [weak self] _ in
            guard let self = self else { return }
            let vc = TabbarController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func setConstraints(){
        view.addSubview(imageView)
        view.addSubview(iconView)
        view.addSubview(textImgView)
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
            make.top.equalToSuperview()
        }
        
        iconView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(-55)
            make.height.equalTo(view.frame.width / 3)
        }
        
        textImgView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(iconView.snp.bottom).offset(15)
            make.height.equalTo(view.frame.width / 4)
        }
    }
    

}
