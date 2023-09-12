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
        let menuItem = UITabBarItem(title: "Меню", image: UIImage(systemName: "menucard.fill"), tag: 0)
        menuItem.titlePositionAdjustment = .init(horizontal: 0, vertical: 0)
        let navController = UINavigationController(rootViewController: menuVC)
        navController.tabBarItem = menuItem
        
        let basketVC = BasketViewController()
        let basketItem = BasketItem(title: "Корзина", image: UIImage(systemName: "basket.fill"), tag: 0)
        basketItem.titlePositionAdjustment = .init(horizontal: 0, vertical: 0)
        navController.tabBarItem = basketItem
        
        viewControllers = [menuVC, basketVC]
        
//        let MenuViewController = createNavigation(vc: MenuViewController(), itemName: "Меню", imageName: "menucard.fill")
//        let BasketViewController = createNavigation(vc: BasketViewController(), itemName: "Корзина", imageName: "basket.fill")
//        let FavoriteViewController = createNavigation(vc: FavoriteViewController(), itemName: "Любимое", imageName: "heart.fill")
//
//        viewControllers = [MenuViewController, FavoriteViewController, BasketViewController]
    }
    
    func createNavigation(vc: UIViewController, itemName: String, imageName: String) -> UINavigationController {
        
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: imageName)?.withAlignmentRectInsets(.init(top: 0, left: 0, bottom: 0, right: 0)), tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 0)
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        
        
        return navController
    }
}

class BasketItem: UITabBarItem {
    
    override init() {
        super.init()
        badgeValue = String(AppSettings.settings.basket.count)
        badgeColor = .red
        AppSettings.settings.cnahgeBasketClosure = { [weak self] in
            guard let self = self else {return}
            badgeValue = String(AppSettings.settings.basket.count)
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
                count += product.priceProduct
            }
            self.text = String(count)
        }
    }
    
}
