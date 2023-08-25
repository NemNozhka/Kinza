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
        imageProductView.image = info.imageProduct
        labelNameProduct.text = info.nameProduct
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private enum UIConstants {
        
        static let colorLabelLikeCholdren: UIColor = UIColor(red: 255.0 / 255.0, green: 71.0 / 255.0, blue: 71.0 / 255.0, alpha: 100.0 / 100)
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
        static let heightLikeCholdren: CGFloat = 25
        static let weidtLikeCholdren: CGFloat = 90
        static let likeChildreLabelFontSize: CGFloat = 11
        static let offsetLikeChildreFromImageProduct: CGFloat = 10
        static let insetLikeChildreFromImageProductTop: CGFloat = -7
        
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
}

//MARK: - Private methods
private extension BasketViewCell {
    func initialize() {
        contentView.backgroundColor = .systemGray6
        selectionStyle = .none //убрали выделение ячейки
        contentView.addSubview(imageProductView)
        imageProductView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIConstants.insetImageProductFromTop)
            make.leading.equalToSuperview().inset(UIConstants.insetImageProductFromLeading)
            //make.height.equalTo(contentView.snp.width) //высота равна ширине
            make.size.equalTo(UIConstants.imageProductSize)
            make.bottom.equalToSuperview()
        }
        
        contentView.addSubview(labelNameProduct)
        labelNameProduct.snp.makeConstraints { make in
           make.centerY.equalTo(imageProductView)
            make.leading.equalTo(imageProductView.snp.trailing).offset(UIConstants.insetNameAndDiscriptionFromImage)
            make.trailing.equalToSuperview().inset(UIConstants.insetNameAndDiscriptionFromTrailing)
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
