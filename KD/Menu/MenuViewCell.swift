//
//  MenuViewCell.swift
//  KD
//
//  Created by Сергей Ножка on 03.08.2023.
//

import UIKit
import SnapKit

class MenuViewCell: UITableViewCell {
    
    func configure(with info: ProductModel) {
        imageProductView.image = info.imageProduct
        labelNameProduct.text = info.nameProduct
        labelDiscriptionProduct.text = info.discriptionProduct
        buttonAddBasketProduct.setTitle("\(info.priceProduct) Р.", for: .normal)
        likeChildrenLabel.isHidden = !info.itLikeChildren
        spicyLabel.isHidden = !info.isSpicy
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // constant: 50
    // let spacing: CGFloat = 50
    // constant: spacing
    private enum UIConstants {
        
        static let colorLabelLikeChildren: UIColor = UIColor(red: 255.0 / 255.0, green: 71.0 / 255.0, blue: 71.0 / 255.0, alpha: 100.0 / 100)
        static let colorSpicyLabel: UIColor = UIColor(red: 255.0 / 255.0, green: 71.0 / 255.0, blue: 71.0 / 255.0, alpha: 100.0 / 100)
        static let colorBackGroundColorButton: UIColor = UIColor(red: 149.0 / 255.0, green: 202.0 / 255.0, blue: 31.0 / 255.0, alpha: 60.0 / 100)
        
        static let imageProductSize: CGFloat = 160
        static let labelNameProductSize: CGFloat = 20
        static let spacingBetweenNameAndDiscription: CGFloat = 10
        static let labelDiscriptionProductSize: CGFloat = 15
        static let insetImageProductFromTop: CGFloat = 15
        static let insetImageProductFromLeading: CGFloat = 15
        static let insetButtonFromBottom: CGFloat = 10
        static let insetButtonFromTrailing: CGFloat = 40
        static let insetButtonTrailing: CGFloat = 90
        static let nameProductAndPriceProductStackViewSpacing: CGFloat = 12
        static let insetButtonFromStackView: CGFloat = 12
        static let nameProductAndPriceProductStackViewHeight: CGFloat = 24
        static let insetNameAndDiscriptionFromImage: CGFloat = 12
        static let insetNameAndDiscriptionFromTrailing: CGFloat = 12
        static let weidthtButton: CGFloat = 90
        static let labelNameProductFontSize: CGFloat = 14
        static let heightLikeChildren: CGFloat = 25
        static let weidtLikeChildren: CGFloat = 110
        static let likeChildrenLabelFontSize: CGFloat = 11
        static let insetLikeChildrenFromImageProduct: CGFloat = 25
        static let insetLikeChildrenFromImageProductTop: CGFloat = 12
        static let insetSpicyLabelFromImageProduct: CGFloat = 25
        static let insetSpicyLabelFromImageProductTop: CGFloat = 12
        static let spicyLabelLabelFontSize: CGFloat = 11
        static let heightSpicyLabel: CGFloat = 25
        static let weidtSpicyLabel: CGFloat = 70
        
    }
    
    //MARK: - изображение продукта
    private let imageProductView: UIImageView = {
       let imageProductView = UIImageView()
        imageProductView.layer.cornerRadius = UIConstants.imageProductSize * 0.15
        imageProductView.clipsToBounds = true
        return imageProductView
    }()
    
    //MARK: - Надпись названия продукта
    private let labelNameProduct: UILabel = {
        let labelNameProduct = UILabel()
        labelNameProduct.font = .systemFont(ofSize: UIConstants.labelNameProductSize, weight: .bold)
        labelNameProduct.numberOfLines = 0
        return labelNameProduct
    }()
    
    //MARK: - Надпись описания продукта
    private let labelDiscriptionProduct: UILabel = {
        let labelDiscriptionProduct = UILabel()
        labelDiscriptionProduct.font = .systemFont(ofSize: UIConstants.labelDiscriptionProductSize, weight: .light)
        labelDiscriptionProduct.numberOfLines = 0
        labelDiscriptionProduct.textColor = .systemGray
        return labelDiscriptionProduct
    }()
    
    //MARK: - Кнопка добавления продукта в корзину
    private let buttonAddBasketProduct: UIButton = {
        let buttonAddBasketProduct = UIButton(type: .system)
        buttonAddBasketProduct.titleLabel?.font = .systemFont(ofSize: UIConstants.labelNameProductSize, weight: .medium)
        buttonAddBasketProduct.backgroundColor = UIConstants.colorBackGroundColorButton
        buttonAddBasketProduct.tintColor = .black
        buttonAddBasketProduct.layer.cornerRadius = 10
        buttonAddBasketProduct.addTarget(self, action: #selector(didTapAddBasketProduct), for: .touchUpInside)
        return buttonAddBasketProduct
    }()
    
    var addProductClosure: (() -> Void)?
    
    @objc func didTapAddBasketProduct() {
        print("Tap AddBasketProduct")
        addProductClosure?()
        
        
    }
    
    //MARK: - title дети обожают
    private let likeChildrenLabel: UILabel = {
       let likeLabel = UILabel()
        likeLabel.text = "Дети обожают"
        likeLabel.backgroundColor = UIConstants.colorLabelLikeChildren
        likeLabel.font = .systemFont(ofSize: UIConstants.likeChildrenLabelFontSize, weight: .medium)
        likeLabel.textColor = .white
        likeLabel.clipsToBounds = true
        likeLabel.layer.cornerRadius = 10
        likeLabel.textAlignment = .center
        return likeLabel
    }()
    
    //MARK: - title острая
    private let spicyLabel: UILabel = {
       let spicyLabel = UILabel()
        spicyLabel.text = "Острая"
        spicyLabel.backgroundColor = UIConstants.colorSpicyLabel
        spicyLabel.font = .systemFont(ofSize: UIConstants.spicyLabelLabelFontSize, weight: .medium)
        spicyLabel.textColor = .white
        spicyLabel.clipsToBounds = true
        spicyLabel.layer.cornerRadius = 10
        spicyLabel.textAlignment = .center
        return spicyLabel
    }()
    
}

//MARK: - Private methods
private extension MenuViewCell {
    func initialize() {
        contentView.backgroundColor = .systemGray6
        selectionStyle = .none //убрали выделение ячейки
        contentView.addSubview(imageProductView)
        imageProductView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(UIConstants.insetImageProductFromLeading)
            //make.height.equalTo(contentView.snp.width) //высота равна ширине
            make.size.equalTo(UIConstants.imageProductSize)
        }
        
        let nameProductAndPriceProductStackView = UIStackView()
        nameProductAndPriceProductStackView.axis = .vertical
        nameProductAndPriceProductStackView.addArrangedSubview(labelNameProduct)
        nameProductAndPriceProductStackView.addArrangedSubview(labelDiscriptionProduct)
        nameProductAndPriceProductStackView.layer.cornerRadius = 4
        nameProductAndPriceProductStackView.spacing = UIConstants.spacingBetweenNameAndDiscription
        contentView.addSubview(nameProductAndPriceProductStackView)
        nameProductAndPriceProductStackView.snp.makeConstraints { make in
           make.centerY.equalTo(imageProductView)
            make.leading.equalTo(imageProductView.snp.trailing).offset(UIConstants.insetNameAndDiscriptionFromImage)
            make.trailing.equalToSuperview().inset(UIConstants.insetNameAndDiscriptionFromTrailing)
        }
        
        contentView.addSubview(likeChildrenLabel)
        likeChildrenLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageProductView).inset(UIConstants.insetLikeChildrenFromImageProduct)
            make.top.equalTo(imageProductView).inset(UIConstants.insetLikeChildrenFromImageProductTop)
            make.height.equalTo(UIConstants.heightLikeChildren)
            make.width.equalTo(UIConstants.weidtLikeChildren)
        }
        
        contentView.addSubview(spicyLabel)
        spicyLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageProductView).inset(UIConstants.insetSpicyLabelFromImageProduct)
            make.top.equalTo(imageProductView).inset(UIConstants.insetSpicyLabelFromImageProductTop)
            make.height.equalTo(UIConstants.heightSpicyLabel)
            make.width.equalTo(UIConstants.weidtSpicyLabel)
        }
        
        
        contentView.addSubview(buttonAddBasketProduct)
        buttonAddBasketProduct.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(UIConstants.insetButtonFromBottom)
            make.trailing.equalToSuperview().inset(UIConstants.insetButtonFromTrailing)
            make.top.equalTo(nameProductAndPriceProductStackView.snp.bottom).offset(UIConstants.insetButtonFromStackView)
            make.width.equalTo(UIConstants.weidthtButton)
        }
        
        
    }
    
    func configureLabelDiscriptionProduct(with label: ProductModel) {
        let string = label.nameProduct
        let attributeString = NSMutableAttributedString(string: string)
        let range = NSRange(location: .zero, length: label.nameProduct.count)
        attributeString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: UIConstants.labelNameProductFontSize), range: range)
        labelNameProduct.attributedText = attributeString
    }
}
