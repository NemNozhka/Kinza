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
    let numberPhoneTextField = TextFieldController(placeholder: "Ваш номер телефона", isPhoneNumberField: true)
    let commentTextField = TextFieldController(placeholder: "Комментарий к заказу")
    let adressTextField = TextFieldController(placeholder: "Адресс доставки")
    
    
    
    //MARK: - configure
    func configure() {
        
        backgroundColor = .systemGray6
        
        addSubview(summLabel)
        summLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(UIConstants.ConstantsForTableFooterViewForBasket.insetSummLabelFromLeading)
        }
        
        addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(summLabel.snp.bottom).offset(UIConstants.ConstantsForTableFooterViewForBasket.offsetTextFieldFromTop)
            make.height.equalTo(UIConstants.ConstantsForTableFooterViewForBasket.heightTextField)
            make.width.equalTo(UIConstants.ConstantsForTableFooterViewForBasket.widthTextField)
            make.centerX.equalToSuperview()
        }
        
        addSubview(numberPhoneTextField)
        numberPhoneTextField.translatesAutoresizingMaskIntoConstraints = false
        numberPhoneTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(UIConstants.ConstantsForTableFooterViewForBasket.offsetTextFieldFromTop)
            make.height.equalTo(UIConstants.ConstantsForTableFooterViewForBasket.heightTextField)
            make.width.equalTo(UIConstants.ConstantsForTableFooterViewForBasket.widthTextField)
            make.centerX.equalToSuperview()
        }
        
        addSubview(commentTextField)
        commentTextField.translatesAutoresizingMaskIntoConstraints = false
        commentTextField.snp.makeConstraints { make in
            make.top.equalTo(numberPhoneTextField.snp.bottom).offset(UIConstants.ConstantsForTableFooterViewForBasket.offsetTextFieldFromTop)
            make.height.equalTo(UIConstants.ConstantsForTableFooterViewForBasket.heightTextField)
            make.width.equalTo(UIConstants.ConstantsForTableFooterViewForBasket.widthTextField)
            make.centerX.equalToSuperview()
        }
        
        addSubview(deliveryLabelMain)
        deliveryLabelMain.snp.makeConstraints { make in
            make.top.equalTo(commentTextField.snp.bottom).offset(UIConstants.ConstantsForTableFooterViewForBasket.insetDeliveryLabelFromTextField)
            make.width.equalTo(UIConstants.ConstantsForTableFooterViewForBasket.widthDeliveryLabel)
            make.centerX.equalToSuperview()
        }
        
        addSubview(deliveryLabelSubMain)
        deliveryLabelSubMain.snp.makeConstraints { make in
            make.top.equalTo(deliveryLabelMain.snp.bottom).offset(UIConstants.ConstantsForTableFooterViewForBasket.insetDeliveryLabelFromDeliveryLabel)
            make.width.equalTo(UIConstants.ConstantsForTableFooterViewForBasket.widthDeliveryLabel)
            make.centerX.equalToSuperview()
        }
        
        deliveryRadioButton.snp.makeConstraints { make in
            make.size.equalTo(UIConstants.ConstantsForTableFooterViewForBasket.sizeRadioButton)
        }
        selfDeliveryRadioButton.snp.makeConstraints { make in
            make.size.equalTo(UIConstants.ConstantsForTableFooterViewForBasket.sizeRadioButton)
        }
        let deliveryStackView = UIStackView()
        deliveryStackView.addArrangedSubview(deliveryRadioButton)
        deliveryStackView.addArrangedSubview(deliveryLabel)
        deliveryStackView.axis = .horizontal
        deliveryStackView.spacing = UIConstants.ConstantsForTableFooterViewForBasket.spacingDeliveryStackView
        
        let selfDeliveryStackView = UIStackView()
        selfDeliveryStackView.addArrangedSubview(selfDeliveryRadioButton)
        selfDeliveryStackView.addArrangedSubview(selfDeliveryLabel)
        selfDeliveryStackView.axis = .horizontal
        selfDeliveryStackView.spacing = UIConstants.ConstantsForTableFooterViewForBasket.spacingDeliveryStackView
        let deliveryMethodStackView = UIStackView()
        
        addSubview(deliveryMethodStackView)
        deliveryMethodStackView.addArrangedSubview(deliveryStackView)
        deliveryMethodStackView.addArrangedSubview(selfDeliveryStackView)
        deliveryMethodStackView.axis = .vertical
        deliveryMethodStackView.spacing = UIConstants.ConstantsForTableFooterViewForBasket.spacingDeliveryMethodStackView
        deliveryMethodStackView.snp.makeConstraints { make in
            make.top.equalTo(deliveryLabelSubMain.snp.bottom).offset(UIConstants.ConstantsForTableFooterViewForBasket.offsetDeliveryMethodStackViewFromTop)
            make.leading.equalToSuperview().inset(UIConstants.ConstantsForTableFooterViewForBasket.insetDeliveryMethodStackViewFromLeading)
            
        }
        
        addSubview(adressTextField)
        adressTextField.translatesAutoresizingMaskIntoConstraints = false
        adressTextField.snp.makeConstraints { make in
            make.height.equalTo(UIConstants.ConstantsForTableFooterViewForBasket.heightTextField)
            make.width.equalTo(UIConstants.ConstantsForTableFooterViewForBasket.widthTextField)
            make.centerX.equalToSuperview()
            make.top.equalTo(deliveryMethodStackView.snp.bottom).offset(UIConstants.ConstantsForTableFooterViewForBasket.offsetTextFieldFromTop)
        }
        
        addSubview(priceDeliveryLabel)
        priceDeliveryLabel.snp.makeConstraints { make in
            make.top.equalTo(adressTextField.snp.bottom).offset(UIConstants.ConstantsForTableFooterViewForBasket.offsetPriceDeliveryLabelFromTop)
            make.centerX.equalToSuperview()
        }
        
        addSubview(orderButton)
        orderButton.snp.makeConstraints { make in
            make.top.equalTo(priceDeliveryLabel.snp.bottom).offset(UIConstants.ConstantsForTableFooterViewForBasket.offsetOrderButtonFromTop)
            make.centerX.equalToSuperview()
            make.height.equalTo(UIConstants.ConstantsForTableFooterViewForBasket.heightOrderButton)
            make.width.equalTo(UIConstants.ConstantsForTableFooterViewForBasket.widthOrderButton)
        }
        
        updateSumLabel()
        updateOrderButtonState()
        
        nameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        numberPhoneTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        adressTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        NotificationCenter.default.addObserver(self, selector: #selector(basketChanged), name: Notification.Name("BasketChanged"), object: nil)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        updateOrderButtonState()
    }
    
    func updateOrderButtonState() {
        let phoneFormat = "^\\+7\\(\\d{3}\\)\\d{3}-\\d{2}-\\d{2}$"
        let phonePredicate = NSPredicate(format:"SELF MATCHES %@", phoneFormat)
        let isPhoneValid = phonePredicate.evaluate(with: numberPhoneTextField.text)
        
        if usedDelivery {
            let fieldsFilled = !(nameTextField.text?.isEmpty ?? true) &&
                               isPhoneValid &&
                               !(adressTextField.text?.isEmpty ?? true)
            orderButton.isEnabled = fieldsFilled
            orderButton.backgroundColor = fieldsFilled ? UIConstants.Colors.colorBackGroundColorButton : .systemGray4
        } else if usedSelfDelivery {
            let fieldsFilled = !(nameTextField.text?.isEmpty ?? true) &&
                               isPhoneValid
            orderButton.isEnabled = fieldsFilled
            orderButton.backgroundColor = fieldsFilled ? UIConstants.Colors.colorBackGroundColorButton : .systemGray4
        }
    }
   
    
    @objc func basketChanged() {
        updateSumLabel()
    }
    
    func updateSumLabel() {
        let totalPrice = AppSettings.settings.calculateTotalPrice()
        summLabel.text = "Сумма заказа: \(totalPrice) Руб."
        orderButton.setTitle("Оформить заказ на \(totalPrice) Руб.", for: .normal)
        if AppSettings.settings.isDeliveryFree() {
            priceDeliveryLabel.text = "Доставка бесплатно!"
            orderButton.setTitle("Оформить заказ на \(totalPrice) Руб.", for: .normal)
        } else {
            priceDeliveryLabel.text = "Стоимость доставки 100 рублей."
            orderButton.setTitle("Оформить заказ на \(totalPrice + AppSettings.priceDelivery) Руб.", for: .normal)
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
        label.text = "Вы можете забрать заказ по адрессу: г. Балаково, ул. Шоссе Энергетиков, 1/2. Доставка осуществляется в пределах города Балаково."
        label.font = .systemFont(ofSize: UIConstants.ConstantsForMenuViewCell.labelDiscriptionProductSize, weight: .light)
        return label
    }()
    
    private let deliveryLabel: UILabel = {
        let label = UILabel()
        label.text = "Доставка курьером"
        return label
    }()
    
    var usedDelivery: Bool = true
    var usedSelfDelivery: Bool = false
    
    private let deliveryRadioButton: UIButton = {
        let button = UIButton()
        button.contentHorizontalAlignment = .fill
            button.contentVerticalAlignment = .fill
            button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .black
        button.setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
        button.addTarget(self, action: #selector(tapDeliveryRadioButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tapDeliveryRadioButton() {
        usedDelivery = true
        if usedDelivery == true {
            deliveryRadioButton.setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
            selfDeliveryRadioButton.setImage(UIImage(systemName: "circle"), for: .normal)
            adressTextField.isEnabled = true
            usedSelfDelivery = false
        }
        print("usedDelivery = \(usedDelivery)")
        print("usedSelfDelivery = \(usedSelfDelivery)")
        updateOrderButtonState()
    }
    
    private let selfDeliveryLabel: UILabel = {
        let label = UILabel()
        label.text = "Самовывоз"
        
        return label
    }()
    
    private let selfDeliveryRadioButton: UIButton = {
        let button = UIButton()
        button.contentHorizontalAlignment = .fill
            button.contentVerticalAlignment = .fill
            button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .black
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.addTarget(self, action: #selector(tapSelfDeliveryRadioButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tapSelfDeliveryRadioButton() {
        usedSelfDelivery = true
        if usedSelfDelivery == true {
            deliveryRadioButton.setImage(UIImage(systemName: "circle"), for: .normal)
            selfDeliveryRadioButton.setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
            adressTextField.isEnabled = false
        }
        usedDelivery = false
        print("usedDelivery = \(usedDelivery)")
        print("usedSelfDelivery = \(usedSelfDelivery)")
        updateOrderButtonState()
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
    
    var removeAllProductBasket: (() -> Void)?
    var onShowThankYouView: (() -> Void)?
    
    @objc func orderButtonTapped() {
                sendOrderDetailsToTelegram()
        onShowThankYouView?()
        removeAllProductBasket?()
    }
    
    func sendOrderDetailsToTelegram() {
        let orderDetails = gatherOrderDetails()
        TelegramBot.botTG.sendMessage(orderDetails) { result in
            switch result {
            case .success(let message):
                print(message)  // Вывод успешного сообщения
            case .failure(let error):
                print("Failed to send message: \(error)")  // Обработка ошибки
            }
        }
    }
    
    func gatherOrderDetails() -> String {
        let totalSum = AppSettings.settings.calculateTotalPrice()
        
        var productsDetails = ""
        for (_, product) in AppSettings.settings.basket {
            if product.isWeightProduct {
                // Форматируем вес до двух знаков после запятой
                let formattedWeight = String(format: "%.1f", product.weightProduct)
                let productDetail = """
                Наименование: \(product.nameProduct)
                Вес: \(formattedWeight) кг
                """
                productsDetails.append(contentsOf: productDetail)
            } else {
                let productDetail = """
                Наименование: \(product.nameProduct)
                Количество: \(product.quantityProduct) шт.
                """
                productsDetails.append(contentsOf: productDetail)
            }
            productsDetails.append("\n")  // Добавляем новую строку между товарами
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


