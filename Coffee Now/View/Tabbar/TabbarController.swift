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
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: 30, y: self.tabBar.bounds.minY + 0, width: self.tabBar.bounds.width - 60, height: self.tabBar.bounds.height + 10), cornerRadius: (self.tabBar.frame.width/2)).cgPath
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        layer.shadowRadius = 25.0
        layer.shadowOpacity = 0.3
        layer.borderWidth = 1.0
        layer.opacity = 1.0
        layer.isHidden = false
        layer.masksToBounds = false
        layer.fillColor = UIColor.white.cgColor
          
        self.tabBar.layer.insertSublayer(layer, at: 0)
        
        if let items = self.tabBar.items {
          items.forEach { item in item.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) }
        }

        self.tabBar.itemWidth = 30.0
        self.tabBar.itemPositioning = .centered
        
        let home = UINavigationController(rootViewController: HomeVC())
        home.tabBarItem.image = UIImage(named: "home")
        
        let search = UINavigationController(rootViewController: SearchVC())
        search.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        search.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass.circle.fill")
        
        let transaction = UINavigationController(rootViewController: TransactionsVC())
        transaction.tabBarItem.image = UIImage(named: "privacy")
        
        let profile = UINavigationController(rootViewController: ProfileVC())
        profile.tabBarItem.image = UIImage(named: "profileTabbar")
        
        tabBar.barTintColor = .brown
        tabBar.isTranslucent = false
        
        setViewControllers([profile, search, transaction, home], animated: true)
    }

}
