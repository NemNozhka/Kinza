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
        let MenuViewController = createNavigation(vc: MenuViewController(), itemName: "Меню", imageName: "menucard.fill")
        let BasketViewController = createNavigation(vc: BasketViewController(), itemName: "Корзина", imageName: "basket.fill")
        let FavoriteViewController = createNavigation(vc: FavoriteViewController(), itemName: "Любимое", imageName: "heart.fill")
        
        viewControllers = [MenuViewController, FavoriteViewController, BasketViewController]
    }
    
    func createNavigation(vc: UIViewController, itemName: String, imageName: String) -> UINavigationController {
        
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: imageName)?.withAlignmentRectInsets(.init(top: 0, left: 0, bottom: 0, right: 0)), tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 0)
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        
        
        return navController
    }
}

