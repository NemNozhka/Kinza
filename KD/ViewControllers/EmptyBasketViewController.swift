//
//  EmptyBasketViewController.swift
//  KD
//
//  Created by Сергей Ножка on 10.10.2023.
//

import Foundation
import UIKit
import SnapKit


class EmptyBasketViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeUI()
    }
    
    func initializeUI() {
        view.backgroundColor = .systemGray6
        
        view.addSubview(imageEmpty)
        imageEmpty.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(200)
            make.size.equalTo(250)
        }
        
        view.addSubview(labelEmpty)
        labelEmpty.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageEmpty.snp.bottom).offset(30)
        }
        
        view.addSubview(buttonEmpty)
        buttonEmpty.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(labelEmpty.snp.bottom).offset(30)
            make.width.equalTo(UIConstants.ConstantsForSingleProductView.widthAddBasketButton)
            make.height.equalTo(UIConstants.ConstantsForSingleProductView.heightAddBusketButton)
        }
        
    }
    
    private let imageEmpty: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "КоробкаПиццы")
        
        return image
    }()
    
    private let labelEmpty: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "Вы еще не выбрали что покушать"
        return label
    }()
    
    private let buttonEmpty: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: UIConstants.ConstantsForMenuViewCell.labelButtonAddBusketFontSize, weight: .medium)
        button.backgroundColor = UIConstants.Colors.colorBackGroundColorButton
        button.setTitle("Перейти в меню", for: .normal)
        button.tintColor = .black
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tapButtonEmpty), for: .touchUpInside)
        return button
    }()
    
    @objc func tapButtonEmpty(_ sender: UIButton) {
        let menuViewController = MenuViewController()
            navigationController?.pushViewController(menuViewController, animated: true)
            
            if let mainTabBarController = self.tabBarController as? MainTabBarController {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    mainTabBarController.switchToTab(index: 0)  // 0 for Menu tab
                }
            }
    }
}
