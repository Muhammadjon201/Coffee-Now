//
//  TabbarController.swift
//  Coffee Now
//
//  Created by ericzero on 3/21/23.
//

import UIKit

class TabbarController: UITabBarController {

    let backgroundViewColor = UIColor(red: 255/229, green: 255/229, blue: 255/229, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabbar()
    }
  
    func setTabbar(){
        view.backgroundColor = backgroundViewColor
        
        let home = UINavigationController(rootViewController: HomeVC())
        home.tabBarItem.image = UIImage(named: "home")
        
        let search = UINavigationController(rootViewController: SearchVC())
        search.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        search.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass.circle.fill")
        
        let transaction = UINavigationController(rootViewController: TransactionsVC())
        transaction.tabBarItem.image = UIImage(named: "privacy")
        
        let profile = UINavigationController(rootViewController: ProfileVC())
        profile.tabBarItem.image = UIImage(named: "profileTabbar")
        
        tabBar.backgroundColor = .white
        
        setViewControllers([home, search, transaction, profile], animated: true)
    }

}
