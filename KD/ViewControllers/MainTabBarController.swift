//
//  ViewController.swift
//  KD
//
//  Created by Сергей Ножка on 03.08.2023.
//

import SnapKit
import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(basketChanged), name: Notification.Name("BasketChanged"), object: nil)
        setupTabBarControllers()
        updateBadgeValue()
    }
    
    @objc func basketChanged() {
        updateBadgeValue()
    }

    func updateBadgeValue() {
        let itemCount = AppSettings.settings.basket.values.reduce(0) { $0 + $1.count }
        self.tabBar.items?[1].badgeValue = "\(itemCount)"
    }
    
    func setupTabBarControllers() {
        let menuVC = MenuViewController()
        let menuNavVC = UINavigationController(rootViewController: menuVC)
        let menuTabBarItem = UITabBarItem(title: "Меню", image: UIImage(systemName: "menucard"), selectedImage: UIImage(systemName: "menucard.fill"))
        menuNavVC.tabBarItem = menuTabBarItem
        
        let basketVC = BasketViewController()
        let basketNavVC = UINavigationController(rootViewController: basketVC)
        let basketTabBarItem = UITabBarItem(title: "Корзина", image: UIImage(systemName: "basket"), selectedImage: UIImage(systemName: "basket.fill"))
        basketNavVC.tabBarItem = basketTabBarItem
        
        let favoriteVC = FavoriteViewController()
        let favoriteNavVC = UINavigationController(rootViewController: favoriteVC)
        let favoriteTabBarItem = UITabBarItem(title: "Любимое", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        favoriteNavVC.tabBarItem = favoriteTabBarItem

        viewControllers = [menuNavVC, basketNavVC, favoriteNavVC]
    }
}



class BasketLabel: UILabel {
    
    convenience init() {
        self.init(frame: .zero)
        AppSettings.settings.cnahgeBasketClosure = { [weak self] in
            guard let self = self else {return}
            var count = 0
            for product in AppSettings.settings.basket {
                //                count += product.priceProduct
            }
            self.text = String(count)
        }
    }
}
