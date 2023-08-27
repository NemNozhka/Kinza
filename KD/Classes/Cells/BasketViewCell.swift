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
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
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
    labelNameProduct.font = .systemFont(ofSize: UIConstants.ConstantsForMenuViewCell.labelNameProductSize, weight: .bold)
    labelNameProduct.numberOfLines = 0
    return labelNameProduct
}()


//MARK: - Private methods
private extension BasketViewCell {
    func initialize() {
        contentView.backgroundColor = .systemGray6
        selectionStyle = .none //убрали выделение ячейки
        contentView.addSubview(imageProductView)
        imageProductView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIConstants.ConstantsForMenuViewCell.insetImageProductFromTop)
            make.leading.equalToSuperview().inset(UIConstants.ConstantsForMenuViewCell.insetImageProductFromLeading)
            //make.height.equalTo(contentView.snp.width) //высота равна ширине
            make.size.equalTo(UIConstants.ConstantsForMenuViewCell.imageProductSize)
            make.bottom.equalToSuperview()
        }
        
        contentView.addSubview(labelNameProduct)
        labelNameProduct.snp.makeConstraints { make in
            make.centerY.equalTo(imageProductView)
            make.leading.equalTo(imageProductView.snp.trailing).offset(UIConstants.ConstantsForMenuViewCell.insetNameAndDiscriptionFromImage)
            make.trailing.equalToSuperview().inset(UIConstants.ConstantsForMenuViewCell.insetNameAndDiscriptionFromTrailing)
        }
    }
    
    func configureLabelDiscriptionProduct(with label: ProductModel) {
        let string = label.nameProduct
        let attributeString = NSMutableAttributedString(string: string)
        let range = NSRange(location: .zero, length: label.nameProduct.count)
        attributeString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: UIConstants.ConstantsForMenuViewCell.labelNameProductFontSize), range: range)
        labelNameProduct.attributedText = attributeString
    }
}
