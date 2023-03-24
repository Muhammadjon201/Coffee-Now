//
//  ProfileVC.swift
//  Coffee Now
//
//  Created by ericzero on 3/20/23.
//

import UIKit

class ProfileVC: UIViewController {

    lazy var avatarImg: UIImageView = {
        let avatarImg = UIImageView()
        avatarImg.contentMode = .scaleToFill
        avatarImg.clipsToBounds = true
        avatarImg.layer.cornerRadius = 40
        avatarImg.image = UIImage(named: "profile")
        return avatarImg
    }()
    
    lazy var avatarLbl: UILabel = {
        let avatarLbl = UILabel()
        avatarLbl.numberOfLines = 1
        avatarLbl.font = .systemFont(ofSize: 14, weight: .medium)
        avatarLbl.text = "John Doe"
        return avatarLbl
    }()
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setUpElements()
        setUpTableview()
    }
   
    func setUpElements(){
        view.addSubview(avatarImg)
        view.addSubview(avatarLbl)
        
        avatarImg.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(0)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(80)
        }
        avatarLbl.snp.makeConstraints { make in
            make.top.equalTo(avatarImg.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }
    
    func setUpTableview(){
        view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "ProfileTableViewCell")
        tableView.register(ProfileButtonTableViewCell.self, forCellReuseIdentifier: "ProfileButtonTableViewCell")
        tableView.snp.makeConstraints { make in
            make.top.equalTo(avatarLbl.snp.bottom).offset(40)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottom.equalToSuperview()
        }
    }
    
    var profileData = [
        ProfileData(profileIconImg: UIImage(named: "edit"), profileLabel: "Edit Account Info", profileArrowImg: UIImage(named: "arrow")),
        ProfileData(profileIconImg: UIImage(named: "address"), profileLabel: "Address Info", profileArrowImg: UIImage(named: "arrow")),
        ProfileData(profileIconImg: UIImage(named: "payment2"), profileLabel: "Payment Method", profileArrowImg: UIImage(named: "arrow")),
        ProfileData(profileIconImg: UIImage(named: "rewards"), profileLabel: "Rewards or Coupon", profileArrowImg: UIImage(named: "arrow")),
        ProfileData(profileIconImg: UIImage(named: "about"), profileLabel: "Settings", profileArrowImg: UIImage(named: "arrow")),
        ProfileData(profileIconImg: UIImage(named: "rewards"), profileLabel: "Privacy Policy", profileArrowImg: UIImage(named: "arrow")),
        ProfileData(profileIconImg: UIImage(named: "about"), profileLabel: "About Coffee Now Apps", profileArrowImg: UIImage(named: "arrow"))
    ]
}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0...6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
            cell.updateCell(data: profileData[indexPath.row])
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileButtonTableViewCell", for: indexPath) as! ProfileButtonTableViewCell
            cell.backgroundColor = .clear
            return cell
        default:
            let cell = UITableViewCell()
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0...6:
            return 40
        case 7:
            return 50
        default:
            return 30
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
