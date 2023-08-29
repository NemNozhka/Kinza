//
//  BasketViewCell.swift
//  KD
//
//  Created by Сергей Ножка on 03.08.2023.
//

import UIKit
import SnapKit

class BasketViewCell: UITableViewCell {
    
    private let cellID = "cellBasket"
    
    func configure(with info: ProductModel) {
        imageProductView.image = UIImage(named: info.imageProduct)
        labelNameProduct.text = info.nameProduct
        labelPrice.text = "\(String(info.priceProduct)) Руб."
    }
    
    func initialize() {
        contentView.backgroundColor = .systemGray6
        selectionStyle = .none //убрали выделение ячейки
        contentView.addSubview(imageProductView)
        imageProductView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIConstants.ConstantsForBasketViewCell.insetImageProductFromTop)
            make.leading.equalToSuperview().inset(UIConstants.ConstantsForBasketViewCell.insetImageProductFromLeading)
            //make.height.equalTo(contentView.snp.width) //высота равна ширине
            make.size.equalTo(UIConstants.ConstantsForBasketViewCell.imageProductSize)
            make.bottom.equalToSuperview()
        }
        
        contentView.addSubview(labelNameProduct)
        labelNameProduct.snp.makeConstraints { make in
            make.centerY.equalTo(imageProductView)
            make.leading.equalTo(imageProductView.snp.trailing).offset(UIConstants.ConstantsForBasketViewCell.insetNameAndDiscriptionFromImage)
            make.trailing.equalToSuperview().inset(UIConstants.ConstantsForBasketViewCell.insetNameAndDiscriptionFromTrailing)
        }
        contentView.addSubview(labelPrice)
        labelPrice.snp.makeConstraints { make in
            make.top.equalTo(labelNameProduct.snp.bottom).offset(UIConstants.ConstantsForBasketViewCell.insetButtonFromStackView)
            make.trailing.equalToSuperview().inset(UIConstants.ConstantsForBasketViewCell.insetButtonFromTrailing)
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
    
    private let labelPrice: UILabel = {
        let label = UILabel()
        return label
    }()
}
