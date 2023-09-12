//
//  BasketViewCell.swift
//  KD
//
//  Created by Сергей Ножка on 03.08.2023.
//

import UIKit
import SnapKit

//protocol BasketViewCellDelegate: AnyObject {
//    func updateBasket()
//    func indexPathForCell(_ cell: BasketViewCell) -> IndexPath?
//    func deleteProductAtIndexPath(_ indexPath: IndexPath)
//}

class BasketViewCell: UITableViewCell {
    
//    weak var delegateBasketCell: BasketViewCellDelegate?
    
//    var indexPath: IndexPath?
//    var productInfo: ProductModel?
    
    var sumSingleBasket = 0
    
    var productInfo: String? // сюда записываем id
    
    private let cellID = "cellBasket"
    
    func configure(with info: ProductModel) {
        imageProductView.image = UIImage(named: info.imageProduct)
        labelNameProduct.text = info.nameProduct
        labelPrice.text = "\(String(info.priceProduct)) Руб."
        labelPrice.text = String(info.priceProduct)
        labelQuantityProduct.text = String(info.quantityInBasket)
    }
    
    func initialize() {
        contentView.backgroundColor = .systemGray6
        selectionStyle = .none //убрали выделение ячейки
        contentView.addSubview(imageProductView)
        imageProductView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(UIConstants.ConstantsForBasketViewCell.insetImageProductFromLeading)
            make.size.equalTo(UIConstants.ConstantsForBasketViewCell.imageProductSize)
            make.bottom.equalToSuperview().inset(UIConstants.ConstantsForBasketViewCell.insetImageProductFromBottom)
        }
        
        let quantityActionStack = UIStackView()
        quantityActionStack.addArrangedSubview(lessQuantityProductButton)
        quantityActionStack.addArrangedSubview(labelQuantityProduct)
        quantityActionStack.addArrangedSubview(moreQuantityProductButton)
        quantityActionStack.axis = .horizontal
        quantityActionStack.spacing = 10
        
        let quantityAndPriceStack = UIStackView()
        quantityAndPriceStack.addArrangedSubview(quantityActionStack)
        quantityAndPriceStack.addArrangedSubview(labelPrice)
        quantityAndPriceStack.axis = .horizontal
        quantityAndPriceStack.spacing = 30
        
        let dictionaryStack = UIStackView()
        dictionaryStack.addArrangedSubview(labelNameProduct)
        dictionaryStack.addArrangedSubview(quantityAndPriceStack)
        dictionaryStack.axis = .vertical
        dictionaryStack.spacing = 30
        contentView.addSubview(dictionaryStack)
        dictionaryStack.snp.makeConstraints { make in
            make.centerY.equalTo(imageProductView)
            make.leading.equalTo(imageProductView.snp.trailing).offset(20)
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
        return label
    }()
    
    private let labelQuantityProduct: UILabel = {
        let label = UILabel()
        return label
    }()
    private let lessQuantityProductButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus.circle"), for: .normal)
        button.addTarget(self, action: #selector(tapLessQuantityProductButton), for: .touchUpInside)
        return button
    }()
    
    var lessProductClosure: (() -> Void)?
    
    @objc func tapLessQuantityProductButton(_ sender: UIButton) {
        guard let id = self.productInfo else {return}
        AppSettings.settings.removePruduct(id: id)
        print("minus")
        if var number = Int(labelQuantityProduct.text ?? "0") {
            number -= 1
            labelQuantityProduct.text = String(number)
            print(number)
            if number == 0 {
                lessProductClosure?()
//                if let indexPath = delegateBasketCell?.indexPathForCell(self) {
//                    delegateBasketCell?.deleteProductAtIndexPath(indexPath)
//                }
            }
        }
    }
    
    
    private let moreQuantityProductButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.addTarget(self, action: #selector(tapMoreQuantityProductButton), for: .touchUpInside)
        return button
    }()
    
    var moreProductClosure: (() -> Void)?
    
    @objc func tapMoreQuantityProductButton(_ sender: UIButton) {
        print("plus")
        if var number = Int(labelQuantityProduct.text!) {
            number += 1
            labelQuantityProduct.text = String(number)
            print(number)
            moreProductClosure?()
            if let price = Int(labelPrice.text!) {
                sumSingleBasket = number * price
                print("sumSingleBasket = \(sumSingleBasket)")
            }
        }
    }
}

//class ChangeValueButton: UIButton {
//    var id: String?
//}
