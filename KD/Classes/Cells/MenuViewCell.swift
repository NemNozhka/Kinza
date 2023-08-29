//
//  MenuViewCell.swift
//  KD
//
//  Created by Сергей Ножка on 03.08.2023.
//

import UIKit
import SnapKit

class MenuViewCell: UITableViewCell {
    
    private let cellID = "cellMenu"
    
    func configure(with info: ProductModel) {
        imageProductView.image = UIImage(named: info.imageProduct)
        labelNameProduct.text = info.nameProduct
        labelDiscriptionProduct.text = info.discriptionProduct
        buttonAddBasketProduct.setTitle("\(info.priceProduct) Р.", for: .normal)
        likeChildrenLabel.isHidden = !info.itLikeChildren
        spicyLabel.isHidden = !info.isSpicy
    }
    
    func initialize() {
        contentView.backgroundColor = .systemGray6
        selectionStyle = .none //убрали выделение ячейки
        contentView.addSubview(imageProductView)
        imageProductView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(UIConstants.ConstantsForMenuViewCell.insetImageProductFromLeading)
            //make.height.equalTo(contentView.snp.width) //высота равна ширине
            make.size.equalTo(UIConstants.ConstantsForMenuViewCell.imageProductSize)
        }
        
        let nameProductAndPriceProductStackView = UIStackView()
        nameProductAndPriceProductStackView.axis = .vertical
        nameProductAndPriceProductStackView.addArrangedSubview(labelNameProduct)
        nameProductAndPriceProductStackView.addArrangedSubview(labelDiscriptionProduct)
        nameProductAndPriceProductStackView.layer.cornerRadius = 4
        nameProductAndPriceProductStackView.spacing = UIConstants.ConstantsForMenuViewCell.spacingBetweenNameAndDiscription
        contentView.addSubview(nameProductAndPriceProductStackView)
        nameProductAndPriceProductStackView.snp.makeConstraints { make in
            make.centerY.equalTo(imageProductView)
            make.leading.equalTo(imageProductView.snp.trailing).offset(UIConstants.ConstantsForMenuViewCell.insetNameAndDiscriptionFromImage)
            make.trailing.equalToSuperview().inset(UIConstants.ConstantsForMenuViewCell.insetNameAndDiscriptionFromTrailing)
        }
        
        contentView.addSubview(likeChildrenLabel)
        likeChildrenLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageProductView).inset(UIConstants.ConstantsForMenuViewCell.insetLikeChildrenFromImageProduct)
            make.top.equalTo(imageProductView).inset(UIConstants.ConstantsForMenuViewCell.insetLikeChildrenFromImageProductTop)
            make.height.equalTo(UIConstants.ConstantsForMenuViewCell.heightLikeChildren)
            make.width.equalTo(UIConstants.ConstantsForMenuViewCell.widthLikeChildren)
        }
        
        contentView.addSubview(spicyLabel)
        spicyLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageProductView).inset(UIConstants.ConstantsForMenuViewCell.insetSpicyLabelFromImageProduct)
            make.top.equalTo(imageProductView).inset(UIConstants.ConstantsForMenuViewCell.insetSpicyLabelFromImageProductTop)
            make.height.equalTo(UIConstants.ConstantsForMenuViewCell.heightSpicyLabel)
            make.width.equalTo(UIConstants.ConstantsForMenuViewCell.widthSpicyLabel)
        }
        
        contentView.addSubview(buttonAddBasketProduct)
        buttonAddBasketProduct.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(UIConstants.ConstantsForMenuViewCell.insetButtonFromBottom)
            make.trailing.equalToSuperview().inset(UIConstants.ConstantsForMenuViewCell.insetButtonFromTrailing)
            make.top.equalTo(nameProductAndPriceProductStackView.snp.bottom).offset(UIConstants.ConstantsForMenuViewCell.insetButtonFromStackView)
            make.width.equalTo(UIConstants.ConstantsForMenuViewCell.widthButton)
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
        imageProductView.layer.cornerRadius = UIConstants.ConstantsForMenuViewCell.imageProductSize * 0.15
        imageProductView.clipsToBounds = true
        return imageProductView
    }()
    
    //MARK: - Надпись названия продукта
    private let labelNameProduct: UILabel = {
        let labelNameProduct = UILabel()
        labelNameProduct.font = .systemFont(ofSize: UIConstants.ConstantsForMenuViewCell.labelSize, weight: .bold)
        labelNameProduct.numberOfLines = 0
        return labelNameProduct
    }()
    
    //MARK: - Надпись описания продукта
    private let labelDiscriptionProduct: UILabel = {
        let labelDiscriptionProduct = UILabel()
        labelDiscriptionProduct.font = .systemFont(ofSize: UIConstants.ConstantsForMenuViewCell.labelDiscriptionProductSize, weight: .light)
        labelDiscriptionProduct.numberOfLines = 0
        labelDiscriptionProduct.textColor = .systemGray
        return labelDiscriptionProduct
    }()
    
    //MARK: - Кнопка добавления продукта в корзину
    private let buttonAddBasketProduct: UIButton = {
        let buttonAddBasketProduct = UIButton(type: .system)
        buttonAddBasketProduct.titleLabel?.font = .systemFont(ofSize: UIConstants.ConstantsForMenuViewCell.labelSize, weight: .medium)
        buttonAddBasketProduct.backgroundColor = UIConstants.Colors.colorBackGroundColorButton
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
        likeLabel.backgroundColor = UIConstants.Colors.colorLabelLikeChildren
        likeLabel.font = .systemFont(ofSize: UIConstants.ConstantsForMenuViewCell.likeChildrenLabelFontSize, weight: .medium)
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
        spicyLabel.backgroundColor = UIConstants.Colors.colorSpicyLabel
        spicyLabel.font = .systemFont(ofSize: UIConstants.ConstantsForMenuViewCell.spicyLabelLabelFontSize, weight: .medium)
        spicyLabel.textColor = .white
        spicyLabel.clipsToBounds = true
        spicyLabel.layer.cornerRadius = 10
        spicyLabel.textAlignment = .center
        return spicyLabel
    }()
}



