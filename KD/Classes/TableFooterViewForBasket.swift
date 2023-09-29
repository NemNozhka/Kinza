//
//  TableFooterViewForBasket.swift
//  KD
//
//  Created by Сергей Ножка on 05.09.2023.
//

import Foundation
import UIKit
import SnapKit

//MARK: - TableFooterViewForBasket
class TableFooterViewForBasket: UIView {
    
    let nameTextField = TextFieldController(placeholder: "Ваше имя")
    let numberPhoneTextField = TextFieldController(placeholder: "Ваш номер телефона")
    let commentTextField = TextFieldController(placeholder: "Комментарий к заказу")
    let adressTextField = TextFieldController(placeholder: "Адресс доставки")
    
    //MARK: - configure
    func configure() {
        
        addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(20)
        }
        
        addSubview(numberPhoneTextField)
        numberPhoneTextField.translatesAutoresizingMaskIntoConstraints = false
        numberPhoneTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        addSubview(commentTextField)
        commentTextField.translatesAutoresizingMaskIntoConstraints = false
        commentTextField.snp.makeConstraints { make in
            make.top.equalTo(numberPhoneTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        addSubview(deliveryLabelMain)
        deliveryLabelMain.snp.makeConstraints { make in
            make.top.equalTo(commentTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        addSubview(deliveryLabelSubMain)
        deliveryLabelSubMain.snp.makeConstraints { make in
            make.top.equalTo(deliveryLabelMain.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        let deliveryStackView = UIStackView()
        let selfDeliveryStackView = UIStackView()
        let deliveryMethodStackView = UIStackView()
        deliveryStackView.addArrangedSubview(deliveryLabel)
        deliveryStackView.addArrangedSubview(deliveryRadioButton)
        deliveryStackView.axis = .horizontal
        deliveryStackView.spacing = 155
        
        selfDeliveryStackView.addArrangedSubview(selfDeliveryLabel)
        selfDeliveryStackView.addArrangedSubview(selfDeliveryRadioButton)
        selfDeliveryStackView.axis = .horizontal
        selfDeliveryStackView.spacing = 219
        
        addSubview(deliveryMethodStackView)
        deliveryMethodStackView.addArrangedSubview(deliveryStackView)
        deliveryMethodStackView.addArrangedSubview(selfDeliveryStackView)
        deliveryMethodStackView.axis = .vertical
        deliveryMethodStackView.spacing = 10
        deliveryMethodStackView.snp.makeConstraints { make in
            make.top.equalTo(deliveryLabelSubMain.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        
        addSubview(adressTextField)
        adressTextField.translatesAutoresizingMaskIntoConstraints = false
        adressTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(deliveryMethodStackView.snp.bottom).offset(20)
        }
        
        addSubview(orderButton)
        orderButton.snp.makeConstraints { make in
            make.top.equalTo(adressTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(60)
        }
    }
    
    //MARK: - initialize
    convenience init() {
        self.init(frame: .zero)
        frame.size.height = 600
        configure()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as? UITouch {
            self.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    
    private let summLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let deliveryLabelMain: UILabel = {
        let label = UILabel()
        label.text = "Выберите способ доставки:"
        return label
    }()
    
    private let deliveryLabelSubMain: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Вы можете забрать заказ по адрессу: г. Балаково, ул. Шоссе Энергетиков, 1/2. Доставка осуществляется в пределах города."
        label.font = .systemFont(ofSize: UIConstants.ConstantsForMenuViewCell.labelDiscriptionProductSize, weight: .light)
        return label
    }()
    
    private let deliveryLabel: UILabel = {
        let label = UILabel()
        label.text = "Доставка курьером"
        return label
    }()
    
    var usedDelivery: Bool = true
    
    private let deliveryRadioButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
        button.addTarget(self, action: #selector(tapDeliveryRadioButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tapDeliveryRadioButton() {
        if usedDelivery == true {
            deliveryRadioButton.setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
            selfDeliveryRadioButton.setImage(UIImage(systemName: "circle"), for: .normal)
            adressTextField.isEnabled = true
        }
    }
    
    private let selfDeliveryLabel: UILabel = {
        let label = UILabel()
        label.text = "Самовывоз"
        
        return label
    }()
    
    private let selfDeliveryRadioButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.addTarget(self, action: #selector(tapSelfDeliveryRadioButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tapSelfDeliveryRadioButton() {
        if usedDelivery == true {
            deliveryRadioButton.setImage(UIImage(systemName: "circle"), for: .normal)
            selfDeliveryRadioButton.setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
            adressTextField.isEnabled = false
        }
    }
    
    let orderButton: UIButton = {
        let buttonAddBasketProduct = UIButton(type: .system)
        buttonAddBasketProduct.titleLabel?.font = .systemFont(ofSize: UIConstants.ConstantsForMenuViewCell.labelSize, weight: .medium)
        buttonAddBasketProduct.backgroundColor = UIConstants.Colors.colorBackGroundColorButton
        buttonAddBasketProduct.tintColor = .black
        buttonAddBasketProduct.layer.cornerRadius = 10
        //        buttonAddBasketProduct.addTarget(self, action: #selector(didTapAddBasketProduct), for: .touchUpInside)
        return buttonAddBasketProduct
    }()
}


