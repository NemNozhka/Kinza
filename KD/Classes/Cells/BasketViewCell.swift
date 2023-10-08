//
//  BasketViewCell.swift
//  KD
//
//  Created by Сергей Ножка on 03.08.2023.
//

import UIKit
import SnapKit

class BasketViewCell: UITableViewCell {
    
    var productId: String? // сюда записываем id
    private let cellID = "cellBasket"
    
    func configure(with info: ProductModel) {
        imageProductView.image = UIImage(named: info.imageProduct)
        labelNameProduct.text = info.nameProduct
        labelPrice.text = "\(String(info.priceProduct)) Руб."
        productId = info.idProduct
        updateLabels(product: info)
    }
    
    func updateLabels(product: ProductModel) {
        let roundedWeight = round(product.weightProduct * 10) / 10
            labelQuantityProduct.text = product.isWeightProduct ? "\(roundedWeight)" : "\(product.quantityProduct)"
            let pricePerUnit = Double(product.priceProduct)  // Преобразование в Double, если это необходимо
            let totalPrice = product.isWeightProduct ? pricePerUnit * (roundedWeight/0.1) : pricePerUnit * Double(product.quantityProduct)
            let roundedTotalPrice = Int(totalPrice)  // Округление вниз до ближайшего целого числа
            labelPrice.text = "\(roundedTotalPrice) Руб."
    }
    
    func initialize() {
        contentView.backgroundColor = .systemGray6
        selectionStyle = .none //убрали выделение ячейки
        contentView.addSubview(imageProductView)
        imageProductView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(UIConstants.ConstantsForBasketViewCell.insetImageProductFromLeading)
            make.size.equalTo(UIConstants.ConstantsForBasketViewCell.imageProductSize)
        }
        
        contentView.addSubview(labelNameProduct)
        labelNameProduct.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.leading.equalTo(imageProductView.snp.trailing).offset(UIConstants.ConstantsForMenuViewCell.insetNameAndDiscriptionFromImage)
            make.trailing.equalToSuperview().inset(UIConstants.ConstantsForMenuViewCell.insetNameAndDiscriptionFromTrailing)
        }
        
        contentView.addSubview(buttonRemoveItem)
        buttonRemoveItem.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(40)
            make.trailing.equalToSuperview().inset(20)
            make.size.equalTo(23)
        }
        
        moreQuantityProductButton.snp.makeConstraints { make in
            make.size.equalTo(23)  // Укажите желаемый размер
        }
        lessQuantityProductButton.snp.makeConstraints { make in
            make.size.equalTo(23)  // Укажите желаемый размер
        }
        
        let quantityActionStack = UIStackView()
        quantityActionStack.addArrangedSubview(lessQuantityProductButton)
                quantityActionStack.addArrangedSubview(labelQuantityProduct)
                quantityActionStack.addArrangedSubview(moreQuantityProductButton)
                quantityActionStack.axis = .horizontal
                quantityActionStack.spacing = 5
        quantityActionStack.alignment = .center  // Выравнивание элементов по центру по вертикали
        quantityActionStack.distribution = .equalSpacing
        quantityActionStack.layer.cornerRadius = 11
        contentView.addSubview(quantityActionStack)
        quantityActionStack.snp.makeConstraints { make in
            make.leading.equalTo(imageProductView.snp.trailing).offset(20)
            make.bottom.equalToSuperview().inset(20)
            make.width.equalTo(85)
            
        }
        
        contentView.addSubview(labelPrice)
        labelPrice.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(20)
            make.leading.equalTo(quantityActionStack.snp.trailing).offset(20)
            make.height.equalTo(25)
            make.width.equalTo(90)
        }

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - изображение продукта
    private let imageProductView: UIImageView = {
        let imageProductView = UIImageView()
        imageProductView.layer.cornerRadius = UIConstants.ConstantsForBasketViewCell.imageProductSize * 0.15
        imageProductView.clipsToBounds = true
        return imageProductView
    }()
    
    //MARK: - Надпись названия продукта
    private let labelNameProduct: UILabel = {
        let labelNameProduct = UILabel()
        labelNameProduct.font = .systemFont(ofSize: UIConstants.ConstantsForBasketViewCell.labelSize, weight: .bold)
        labelNameProduct.numberOfLines = 0
        return labelNameProduct
    }()
    
    private let labelPrice: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.layer.cornerRadius = 11
        label.textAlignment = .center
        label.backgroundColor = UIConstants.Colors.colorBackGroundColorButton
        return label
    }()
    
    let labelQuantityProduct: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private let lessQuantityProductButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus.circle"), for: .normal)
        button.contentHorizontalAlignment = .fill
            button.contentVerticalAlignment = .fill
            button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .black
        button.addTarget(self, action: #selector(tapLessQuantityProductButton), for: .touchUpInside)
        return button
    }()
    
    var lessProductClosure: (() -> Void)?
    
    @objc func tapLessQuantityProductButton(_ sender: UIButton) {
        
            lessProductClosure?()
        print("minus")
    }
        
    private let moreQuantityProductButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .black
        button.addTarget(self, action: #selector(tapMoreQuantityProductButton), for: .touchUpInside)
        return button
    }()
    
    var moreProductClosure: (() -> Void)?
    
    @objc func tapMoreQuantityProductButton(_ sender: UIButton) {
        moreProductClosure?()
        print("plus")
    }
    
    private let buttonRemoveItem: UIButton = {
       let button = UIButton()
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(tapButtonRemoveItem), for: .touchUpInside)
        return button
    }()
    
    var removeProductClosure: (() -> Void)?
    @objc func tapButtonRemoveItem(_ sender: UIButton) {
        removeProductClosure?()
        print("RemoveItem")
    }
    
}

