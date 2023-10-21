//
//  ThankYouViewController.swift
//  KD
//
//  Created by Сергей Ножка on 20.10.2023.
//

import UIKit
import SnapKit

class ThankYouViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray6
        
        view.addSubview(imageDelivery)
        imageDelivery.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(100)
            make.size.equalTo(UIConstants.ConstantsForSingleProductView.imageProductSize)
        }
        
        view.addSubview(messageLabel)
        messageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageDelivery.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        view.addSubview(oKButton)
        oKButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(messageLabel.snp.bottom).offset(40)
            make.width.equalTo(UIConstants.ConstantsForSingleProductView.widthAddBasketButton)
            make.height.equalTo(UIConstants.ConstantsForSingleProductView.heightAddBusketButton)
            
        }
    }
    
    private let imageDelivery: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = UIConstants.ConstantsForSingleProductView.imageProductSize * 0.15
        image.clipsToBounds = true
        image.image = UIImage(named: "ДоставкаПиццы")
        return image
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Спасибо за ваш заказ! С вами свяжутся для уточнения данных в течении 5 минут."
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let oKButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: UIConstants.ConstantsForMenuViewCell.labelSize, weight: .medium)
        button.backgroundColor = UIConstants.Colors.colorBackGroundColorButton
        button.tintColor = .black
        button.layer.cornerRadius = 10
        button.setTitle("OK", for: .normal)
        button.addTarget(self, action: #selector(tapOKButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tapOKButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
