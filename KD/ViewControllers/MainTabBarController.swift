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
        makeUI()
    }
    
    func makeUI() {
        let menuVC = MenuViewController()
        let menuNavVC = UINavigationController(rootViewController: menuVC)
        menuNavVC.tabBarItem = UITabBarItem(title: "Меню", image: UIImage(systemName: "menucard.fill"), tag: 0)
        
        let basketVC = BasketViewController()
        let basketNavVC = UINavigationController(rootViewController: basketVC)
        basketVC.tabBarItem = BasketItem(title: "Корзина", image: UIImage(systemName: "basket.fill"), tag: 1)
        
        let favoriteVC = FavoriteViewController()
        let favoriteNavVC = UINavigationController(rootViewController: favoriteVC)
        favoriteNavVC.tabBarItem = UITabBarItem(title: "Любимое", image: UIImage(systemName: "heart.fill"), tag: 2)
        
        viewControllers = [menuNavVC, basketVC, favoriteNavVC]
    }
}

class BasketItem: UITabBarItem {
    
    override init() {
        super.init()
        badgeValue = String(AppSettings.settings.basket.count)
        badgeColor = .red
        AppSettings.settings.cnahgeBasketClosure = { [weak self] in
            guard let self = self else {return}
            self.badgeValue = String(AppSettings.settings.basket.count)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
