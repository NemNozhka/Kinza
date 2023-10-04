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
    
    func updateSumLabel() {
        let totalSum = AppSettings.getTotalPrice()
        summLabel.text = "Сумма заказа: \(totalSum) Руб."
        orderButton.setTitle("Оформить заказ на \(totalSum) Руб.", for: .normal)
        priceDeliveryLabel.text = "Стоимость доставки 100 Руб. Для бесплатной доставки добавьте корзину товара на сумму \(AppSettings.minimalPriceDelivery - totalSum) Руб."
        if totalSum > AppSettings.minimalPriceDelivery {
            priceDeliveryLabel.isHidden = true
            orderButton.setTitle("Оформить заказ на \(totalSum) Руб.", for: .normal)
            
        } else {
            priceDeliveryLabel.isHidden = false
            orderButton.setTitle("Оформить заказ на \(totalSum + AppSettings.priceDelivery) Руб.", for: .normal)
        }
    }
    
    //MARK: - configure
    func configure() {
        addSubview(summLabel)
        summLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
        }
        
        addSubview(priceDeliveryLabel)
        priceDeliveryLabel.snp.makeConstraints { make in
            make.top.equalTo(summLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        
        addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(priceDeliveryLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
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
        deliveryStackView.addArrangedSubview(deliveryRadioButton)
        deliveryStackView.addArrangedSubview(deliveryLabel)
        deliveryStackView.axis = .horizontal
        deliveryStackView.spacing = 20
        
        let selfDeliveryStackView = UIStackView()
        selfDeliveryStackView.addArrangedSubview(selfDeliveryRadioButton)
        selfDeliveryStackView.addArrangedSubview(selfDeliveryLabel)
        selfDeliveryStackView.axis = .horizontal
        selfDeliveryStackView.spacing = 20
        let deliveryMethodStackView = UIStackView()
        
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
        frame.size.height = 650
        configure()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as? UITouch {
            self.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    
    let summLabel: UILabel = {
        let label = UILabel()
        label.text = "Сумма заказа:"
        return label
    }()
    
    let priceDeliveryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
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
        buttonAddBasketProduct.addTarget(self, action: #selector(orderButtonTapped), for: .touchUpInside)
        return buttonAddBasketProduct
    }()
    
    @objc func orderButtonTapped() {
        sendOrderDetailsToTelegram()
    }
    
    func sendOrderDetailsToTelegram() {
        
        let orderDetails = gatherOrderDetails()
        TelegramBot.botTG.sendMessage(orderDetails) { result in
            switch result {
            case .success(let message):
                print(message)
            case .failure(let error):
                print("Failed to send message: \(error)")
            }
        }
    }
    
    func gatherOrderDetails() -> String {
        let totalSum = AppSettings.getTotalPrice()
        
        var productsDetails = ""
        for (key, products) in AppSettings.settings.basket {
            guard let product = products.first else { continue }
            let quantity = products.count
            let productDetail = "\(product.nameProduct) - \(quantity) шт.\n"
            productsDetails.append(contentsOf: productDetail)
        }
        
        let userName = nameTextField.text ?? "Не указано"
        let userPhone = numberPhoneTextField.text ?? "Не указано"
        let userComment = commentTextField.text ?? "Без комментариев"
        let deliveryAddress = adressTextField.text ?? "Не указано"
        let deliveryMethod = usedDelivery ? "Доставка курьером" : "Самовывоз"
        
        let orderDetails = """
        Заказ:
        \(productsDetails)
        Имя: \(userName)
        Телефон: \(userPhone)
        Комментарий: \(userComment)
        Способ доставки: \(deliveryMethod)
        Адрес доставки: \(deliveryAddress)
        Сумма заказа: \(totalSum) Руб.
        """
        
        return orderDetails
    }
}


